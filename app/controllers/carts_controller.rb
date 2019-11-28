class CartsController < ApplicationController
  before_action :set_cart, only: [:create, :destroy]
  before_action :check_user,:cart_permit, only: [:show]


  def index
  end

  def show
    @cart = current_user.carts.last
    @total_amount = 0
    @cart.cart_details.each { |detail|
      @total_amount = @total_amount + detail.item.price.round(2)
    }
    @quantity = 0

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

  private

  def check_user
    if current_user.nil? 
      flash[:alert] = "Bien essayé mais il faut se connecter"
      redirect_to new_user_session_path(:subdomain => false)
    else
      @cart = current_user.carts.last
      session[:viewed] = true
    end
  end

  def cart_permit
    if current_user != Cart.find(params[:id]).user
      flash[:alert] = "Ce n'était pas votre panier voici le votre"
      redirect_to user_cart_path(current_user.id, @cart.id)
    end
  end 
end
