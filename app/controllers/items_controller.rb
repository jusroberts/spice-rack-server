class ItemsController < ApplicationController

  def index
    @items = Item.where('name like ?', "%#{params[:q]}%").select [ :name, :id ]

    render json: @items
  end

end
