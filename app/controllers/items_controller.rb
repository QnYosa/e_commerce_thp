class ItemsController < ApplicationController
  before_action :true_admin, only: [:new, :create, :edit,:update,:destroy]
  def index
    @items = Item.all
  end

  def create
  end

  def new
  end

  def edit
  end

  def show
    @item = Item.find(params[:id])
  end

  def update
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
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
