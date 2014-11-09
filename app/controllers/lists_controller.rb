class ListsController < ApplicationController
  before_action :set_list, only: [ :update, :destroy ]

  def index
  end

  def create
    @list = List.new list_params.merge(user_id: current_user.id)

    if @list.save
      redirect_to root_path, notice: 'List was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @list.update list_params
      notice = 'List was successfully updated.'
    else
      notice = 'Something went wrong.'
    end
  rescue
    notice = 'Something went wrong.'
  ensure
    redirect_to root_path, notice: notice
  end

  def destroy
    @list.list_items.destroy_all
    @list.destroy
    
    redirect_to root_path
  end

  private

  def set_list
    @list = List.find params[:id]
    
    not_found unless owned?
  end

  def list_params
    params.require(:list).permit(:name, :description)
  end

  def owned?
    current_user.id == @list.user_id
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

end

