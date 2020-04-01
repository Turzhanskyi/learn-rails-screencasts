# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :find_item, only:      %i[show edit update destroy]
  before_action :check_if_admin, only: %i[edit update new create destroy]

  def index
    @items = Item.all
  end

  # /items/1  GET
  def show
    render plain: 'Page not found', status: 404 unless @item
  end

  # /items/new GET
  def new
    @item = Item.new
  end

  # /items/1/edit GET
  def edit; end

  # /items  POST
  def create
    @item = Item.create(item_params)
    if @item.errors.empty?
      redirect_to item_path(@item)
    else
      render 'new'
    end
  end

  # /items/1  PUT
  def update
    @item.update(item_params)
    if @item.errors.empty?
      redirect_to item_path(@item)
    else
      render 'edit'
    end
  end

  # /items/1  DELETE
  def destroy
    @item.destroy
  end

  private

  def item_params
    params.require(:item).permit(:price, :name, :weight, :real, :description)
  end

  def find_item
    @item = Item.find(params[:id])
  end

  def check_if_admin
    render_403 unless params[:admin]
  end

  def render_403
    render file: 'public/403.html', status: 403
  end
end
