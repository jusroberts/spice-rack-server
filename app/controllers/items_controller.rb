require 'item_display_data_factory'

class ItemsController < ApplicationController

  def index
    render json: ItemDisplayDataFactory.list.map { |item| item if item.include? params[:q].downcase }.reject(&:blank?)
  end

end
