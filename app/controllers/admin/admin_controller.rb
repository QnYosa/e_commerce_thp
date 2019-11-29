class Admin::AdminController < ApplicationController
  include Admin::IndexHelper
  before_action :true_admin
  def index
    @carts = Cart.all
    @items = Item.all
    @orders = Order.all
    @users = User.all
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