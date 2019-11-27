class OrdersController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    cart_id = params["cart_id"]
    user_id = Cart.find(cart_id).user_id
    @order = Order.new(cart_id: cart_id, date: DateTime.now)
    @cart = Cart.create(user_id: current_user.id)
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
