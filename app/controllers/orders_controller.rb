class OrdersController < ApplicationController
  before_action :true_admin, only: [:destroy]
  def index
  end

  def show
  end

  def new
  end

  def create

    puts @amount = params[:price].to_i
    puts @user_id = current_user.id
    puts @cart_id = Cart.where(user_id: @user_id).last.id
    
    customer = Stripe::Customer.create({
    email: params[:stripeEmail],
    source: params[:stripeToken],
    })

    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'eur',
      })

    @order = Order.create(cart_id: @cart_id, date: DateTime.now)
    @cart = Cart.create(user_id: @user_id)
    flash[:success]= "Votre commande a bien été passé"
    redirect_to root_path

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to user_cart_path(@user_id, @cart_id)

  end

  def edit
  end

  def update
  end

  def destroy
    @order = Order.find(params[:id])
    if @order.destroy
      flash[:success] = "La commande a été supprimée"
      redirect_to admin_orders_path
    end
  end

  private

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
