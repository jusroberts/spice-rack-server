require 'item_display_data_factory'

class ListItemsController < ApplicationController

  def create
    if list_item_params[:item_id].blank?
      item = Item.where(item_params).first

      unless item
        item = Item.new item_params

        item_display_data = ItemDisplayDataFactory.new(item.name).data

        for item_name in item.name.split(' ').reverse
          item_display_data = ItemDisplayDataFactory.new(item_name).data

          break unless item_display_data.icon == 'default'
        end if item_display_data.icon == 'default'

        item.icon = item_display_data.icon
        item.color = item_display_data.color

        item.save
      end
    end

    list_item = ListItem.new list_item_params.merge(item_id: item.id)

    unless list_item.save
      flash[:notice] = "#{ list_item.item.name } is already on this list!"
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
    params[:name] = params[:title].downcase.strip.gsub /[^a-zA-Z0-9 ]/, '' if params[:title].present?

    params.permit :name
  end

end