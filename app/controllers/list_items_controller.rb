class ListItemsController < ApplicationController

  def new
    @list_item = ListItem.new list_id: params[:list_id]
  end

  def create
    if list_item_params[:item_id].blank?
      item = Item.where(item_params).first

      unless item
        item = Item.new item_params

        item.save
      end

      params[:list_item][:item_id] = item.id if item
    end

    @list_item = ListItem.new list_item_params

    if @list_item.save
      redirect_to(root_path, notice: 'Item was successfully added.')
    else
      render action: 'new'
    end
  end

  def edit
    @list_item = ListItem.find params[:id]
    @list_item.in_stock = params[:in_stock] == 'true' if params[:in_stock].present?
  end

  def update
    @list_item = ListItem.find params[:id]

    if @list_item.update list_item_params
      redirect_to(root_path, notice: 'Item was successfully updated.')
    else
      render action: 'edit'
    end
  end

  def destroy
    flash[:notice] = 'Deleted'

    ListItem.destroy params[:id]
  rescue
    flash[:notice] = 'Not Deleted'
  ensure
    redirect_to root_path
  end

  private

  def list_item_params
    params.require(:list_item).permit(:list_id, :item_id, :in_stock)
  end

  def item_params
    params[:name] = params[:name].downcase if params[:name].present?

    params.permit :name
  end

end