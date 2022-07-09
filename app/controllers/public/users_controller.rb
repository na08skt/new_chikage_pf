class Public::UsersController < ApplicationController
  def index
  end

  def show
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

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:account_name, :email,
    :introduction, :pare_of_instagram, :pare_of_twitter, :user_state,
    :user_rank)
  end
end
