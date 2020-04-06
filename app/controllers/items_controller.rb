# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :find_item, only: %i[show edit update destroy upvote]
  # before_action :check_if_admin, only: %i[edit update new create destroy]

  def index
    @items = Item.where('price >= ?', params[:price_from])
                 .order('votes_count DESC', 'price')
                 .limit(5)
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

  def upvote
    @item.increment!(:votes_count)
    redirect_to action: :index
  end

  def expensive
    @items = Item.where('price > 1000')
    render :index
  end

  private

  def item_params
    params.require(:item).permit(:price, :name, :weight, :real, :description)
  end

  def find_item
    @item = Item.where(id: params[:id]).first
    render_404 unless @item
  end
end
