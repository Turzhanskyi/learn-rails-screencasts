# frozen_string_literal: true

class ItemsController < ApplicationController
  def index
    @items = Item.all
    render plain: @items.map { |i| "#{i.name}: #{i.price}" }.join(', ')
  end
end
