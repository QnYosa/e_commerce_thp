class ItemsController < ApplicationController
  def index
    @items = Item.all
    if (user_signed_in? == true) && (current_user.carts.last == nil)
    Cart.create(user_id: current_user.id)
    end
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
  end
end
