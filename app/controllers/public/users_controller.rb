class Public::UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit, :update, :withdrawal, :followings, :followers]
  def index
    @users = User.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
    @location_reports = @user.location_reports.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    flash[:notice] = "上書きが完了しました。"
    redirect_to public_user_path(@user)
  end

  def withdrawal
    @user = User.find(params[:id])
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @user.update(user_status: true)
    reset_session
    redirect_to root_path
  end

  def search
    @results = User.search(params[:keyword])
    @word = params[:keyword]
    render 'index'
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

  private
  def user_params
    params.require(:user).permit(:account_name, :email,
    :introduction, :pare_of_instagram, :pare_of_twitter, :user_state,
    :user_rank, :image)
  end
end
