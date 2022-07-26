class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @users = User.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "変更を保存しました"
      redirect_to admin_users_path || admin_top_path
    else
      flash[:alert] = "変更ができませんでした"
      redirect_to admin_users_path || admin_top_path
    end

    def search
      @results = User.search(params[:keyword])
      @results = @results.page(params[:page]).per(10)
      @word = params[:keyword]
      render 'index'
    end
  end

  # def destroy
  #   @comment = User.find(@user)
  #   if @comment.destroy
  #     flash[:notice] = "変更を反映できました。"
  #     redirect_to admin_users_path || admin_top_path
  #   else
  #     flash[:alert] = "問題が発生しました"
  #     redirect_to admin_users_path || admin_top_path
  #   end
  # end

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
