class CartsController < ApplicationController
<<<<<<< HEAD
  before_action :set_cart, only: [:create, :destroy]

  def new
  end

  def index
  end

  def create
  end

  def edit
  end

=======
  def index
  end

>>>>>>> development
  def show
    @cart = current_user.carts.last
  end

<<<<<<< HEAD
  def destroy
  end

  def update
    @cart = current_user.carts.last
    @cart.items
    @item = Item.find(params[:index])
    @cart.items << @item

    redirect_to user_cart_path(current_user.id, @cart.id)
  
=======
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
  end

  def destroy
>>>>>>> development
  end
end
