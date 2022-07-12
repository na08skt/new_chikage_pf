class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def withdrawal
    @user = User.find(params[:id])
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @user.update(user_status: true)
    reset_session
    redirect_to root_path
  end

  # 特定のユーザーがフォローしている人全員
  def followings
    user = User.find(params[:id])
    @users = user.followings
  end

  #　特定のユーザのフォロワー
  def followers
    user = User.find(params[:id])
    @users = user.followers
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:account_name, :email,
    :introduction, :pare_of_instagram, :pare_of_twitter, :user_state,
    :user_rank)
  end
end