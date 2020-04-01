# frozen_string_literal: true

class ItemsController < ApplicationController
  def index
    @items = Item.all
    render plain: @items.map { |i| "#{i.name}: #{i.price}" }.join(', ')
  end

  # /items/1  GET
  def show; end

  # /items/new  GET
  def new; end

  # /items/1/edit  GET
  def edit; end

  # /items  POST
  def create
    @items = Item.create(item_params)
  end

  # /items/1  PUT
  def update; end

  # /items/1  DELETE
  def destroy; end

  private

  def item_params
    params.require(:item).permit(:price, :name, :weight, :real, :description)
  end
end
