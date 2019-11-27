class CartsController < ApplicationController
  before_action :set_cart, only: [:create, :destroy]

  def new
  end

  def index
  end

  def create
  end

  def edit
  end

  def show
    @cart = current_user.carts.last
  end

  def destroy
  end

  def update
    @cart = current_user.carts.last
    @cart.items
    @cart.items << Item.find(params[:id])
  
  end
end
