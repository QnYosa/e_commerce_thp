class AvatarsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def create
    @item = Item.find(params[:item_id])
    @item.avatar.attach(params[:avatar])
    redirect_to(item_path(@item))
  end 
end
