class ListsController < ApplicationController
  before_action :set_list, only: [ :edit, :update, :destroy ]

  def index
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new list_params.merge(user_id: current_user.id)

    if @list.save
      redirect_to root_path, notice: 'List was successfully created.'
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @list.update list_params
      redirect_to root_path, notice: 'List was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @list.destroy
    
    redirect_to root_path
  end

  private

  def set_list
    @list = List.find params[:id]
    
    not_found unless owned?
  end

  def list_params
    params.require(:list).permit(:name, :description, :user_id)
  end

  def owned?
    current_user.id == @list.user_id
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

end

