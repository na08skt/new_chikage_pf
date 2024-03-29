class Public::UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :edit, :update, :withdrawal, :followings, :followers, :favorites, :search]
  def index
    @users = User.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
    @location_reports = @user.location_reports.page(params[:page]).per(3)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    flash[:notice] = "上書きが完了しました"
    redirect_to public_user_path(@user)
    else flash[:alert] = "編集内容でエラーが発生しています。文字数などを見直してください"
      redirect_to edit_public_user_path(@user) || public_user_path
    end
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
    @results = @results.page(params[:page]).per(10)
    @word = params[:keyword]
    render 'index'
  end

  def favorites
    @user = User.find(params[:id])
    favorites= Favorite.where(user_id: @user.id).pluck(:location_report_id)
    @favorite_reports = LocationReport.find(favorites)
  end

  # 特定のユーザーがフォローしている人全員
  def followings
    user = User.find(params[:id])
    @users = user.followings
    @users = @users.page(params[:page]).per(10)
  end

  #　特定のユーザのフォロワー
  def followers
    user = User.find(params[:id])
    @users = user.followers
    @users = @users.page(params[:page]).per(10)
  end

  private
  def user_params
    params.require(:user).permit(:account_name, :email,
    :introduction, :pare_of_instagram, :pare_of_twitter, :user_state,
    :user_rank, :image)
  end
end