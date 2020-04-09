# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :find_item, only: %i[show edit update destroy upvote]
  # before_action :check_if_admin, only: %i[edit update new create destroy]

  def index
    @items = Item
    if params[:price_from]
      @items = @items.where('price >= ?', params[:price_from])
    end
    @items = @items.where('created_at >= ?', 1.day.ago) if params[:today]
    if params[:votes_count]
      @items = @items.where('votes-count >= ?', params[:votes_count])
    end
    @items = @items.all
    @items.order('votes_count DESC', 'price')
  end

  # /items/1  GET
  def show
    # raise 'exception test!'
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
      flash[:success] = 'Item successfully created!'
      redirect_to item_path(@item)
    else
      flash.now[:error] = 'You made mistakes in your form! Pleace correct them.'
      render 'new'
    end
  end

  # /items/1  PUT
  def update
    @item.update(item_params)
    if @item.errors.empty?
      flash[:success] = 'Item successfully updated!'
      redirect_to item_path(@item)
    else
      flash.now[:error] = 'You made mistakes in your form! Pleace correct them.'
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
    params.require(:item).permit(:price, :name, :weight, :real, :description, :image)
  end

  def find_item
    @item = Item.where(id: params[:id]).first
    render_404 unless @item
  end
end
