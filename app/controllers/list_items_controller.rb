class ListItemsController < ApplicationController

  def create
    if list_item_params[:item_id].blank?
      item = Item.where(item_params).first

      unless item
        item = Item.new item_params

        item.save
      end

      params[:list_item][:item_id] = item.id if item
    end

    list_item = ListItem.new list_item_params

    if list_item.save
      notice = 'Item was successfully added.'
    else
      notice = "#{ list_item.item.name } is already on this rack!"
    end
  rescue
    notice = 'Something went wrong.'
  ensure
    redirect_to root_path, notice: notice
  end

  def update
    if ListItem.find(params[:id]).update list_item_params
      notice = 'Item was successfully updated.'
    else
      notice = 'Something went wrong.'
    end
  rescue
    notice = 'Something went wrong.'
  ensure
    redirect_to root_path, notice: notice
  end

  def destroy
    notice = 'Deleted'

    ListItem.destroy params[:id]
  rescue
    notice = 'Not Deleted'
  ensure
    redirect_to root_path, notice: notice
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