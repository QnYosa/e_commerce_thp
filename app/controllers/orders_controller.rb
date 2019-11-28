class OrdersController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    user_id = current_user.id
    cart_id = Cart.where(user_id: user_id).last.id
    @order = Order.create(cart_id: cart_id, date: DateTime.now)
    @cart = Cart.create(user_id: current_user.id)
    flash[:success]= "Votre commande a bien été passé"
    redirect_to root_path
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
