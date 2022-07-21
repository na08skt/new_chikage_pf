class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to admin_user_path(@user)
  end
  
  def search
    @results = User.search(params[:keyword])
    @word = params[:keyword]
    render 'index'
  end

  private

  def user_params
    params.require(:user).permit(:user_condition, :user_rank, :admin_comment, :user_status)
  end
end
