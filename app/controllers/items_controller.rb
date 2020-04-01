# frozen_string_literal: true

class ItemsController < ApplicationController
  def index
    @items = Item.all
    render plain: @items.map { |i| "#{i.name}: #{i.price}" }.join(', ')
  end

  def create
    @items = Item.create(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:price, :name, :weight, :real, :description)
  end
end
