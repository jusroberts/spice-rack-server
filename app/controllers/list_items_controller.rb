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

    unless list_item.save
      flash[:notice] = "#{ list_item.item.name } is already on this rack!"
    end
  rescue
    flash[:notice] = 'Something went wrong.'
  ensure
    redirect_to root_path
  end

  def update
    unless ListItem.find(params[:id]).update list_item_params
      flash[:notice] = 'Something went wrong.'
    end
  rescue
    flash[:notice] = 'Something went wrong.'
  ensure
    redirect_to root_path
  end

  def destroy
    ListItem.destroy params[:id]
  rescue
    flash[:notice] = 'Something went wrong.'
  ensure
    redirect_to root_path
  end

  private

  def list_item_params
    params.require(:list_item).permit(:list_id, :item_id, :in_stock)
  end

  def item_params
    params[:name] = params[:title].downcase.strip if params[:title].present?

    params.permit :name
  end

end