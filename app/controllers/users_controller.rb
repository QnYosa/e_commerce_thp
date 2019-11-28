class UsersController < ApplicationController
  before_action :true_admin, only: [:destroy]
  def index
  end

  def show
    @user = User.find(current_user.id)
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:success] = "L'utilisateur a été supprimé"
      redirect_to admin_users_path
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
