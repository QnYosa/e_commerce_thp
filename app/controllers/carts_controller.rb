class CartsController < ApplicationController
  before_action :set_cart, only: [:create, :destroy]

  def index
  end

  def show
    @cart = current_user.carts.last
    @total_amount = 0
    @cart.cart_details.each { |detail|
      @total_amount = @total_amount + detail.item.price.round(2)
    }
  end
  
  def new
    @cart = Cart.create(user_id: current_user.id)
  end

  def create
    user_id = current_user.id
    Cart.create(user_id: user_id)
  end

  def edit
  end

  def update
    @cart = current_user.carts.last
    @cart.items
    @item = Item.find(params[:index])
    @cart.items << @item

    redirect_to user_cart_path(current_user.id, @cart.id)
  end

  def destroy
  end
end
