class Admin::OrdersController < ApplicationController
  before_action :true_admin
  def index
    @orders = Order.all
  end
  
  private

  def true_admin
    unless current_user.is_admin == true 
      flash[:warning] = "Tu n'es pas l'admin mon kiki"
      redirect_to root_path
    end  
  end
end
