class CartsController < ApplicationController
  before_action :set_cart, only: [:create, :destroy]

  def index
  end

  def show
    @cart = current_user.carts.last
  end
  
  def new
  end

  def create
    cart_id = params["cart_id"]
    user_id = Cart.find(cart_id).user_id
    @order = Order.new(cart_id: cart_id, date: DateTime.now)
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
