class OrdersController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create

    puts @amount = params[:price].to_i * 100
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
      currency: 'usd',
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
  end
end
