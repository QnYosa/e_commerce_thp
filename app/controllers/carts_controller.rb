class CartsController < ApplicationController
  before_action :true_admin, only: [:destroy]
  before_action :check_user,:cart_permit, only: [:show]


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

    if params["cart_detail_id"] != nil
      # delete an element from cart
      CartDetail.destroy(params["cart_detail_id"])
      flash[:success]="L'élement a bien été supprimé du panier"
    else
    # add an element to cart
      @item = Item.find(params[:index])
      @cart.items << @item
      flash[:success]="L'élement a bien été ajouté au panier"
    end

    redirect_to mon_panier_path
  
  end

  def destroy
    @cart = Cart.find(params[:id])
    if @cart.destroy
      flash[:success] = "Le panier a été supprimé"
      redirect_to admin_carts_path
    end
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
    if current_user.is_admin == true
      return false
    else
      if current_user != @cart.user
        flash[:alert] = "Ce n'était pas votre panier voici le votre"
        redirect_to user_cart_path(current_user.id, @cart.id)
      end
    end
  end 

  def true_admin
    if current_user
    unless current_user.is_admin == true 
      flash[:warning] = "Tu n'es pas l'admin mon kiki"
      redirect_to root_path
    end
    else
      flash[:danger] = "Tu n'es pas connecté mon ptit loup, ici, ce sont les chats qui règnent"
      redirect_to root_path
    end
  end
end
