# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :user_condition, only: [:create]
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  def user_condition
  @user = User.find_by(email: params[:user][:email])
  return if !@user
  # PWがあっているかつ、user_statusがtrueになっている場合、退会済みの会員
  if @user.valid_password?(params[:user][:password]) && (@user.user_condition == true)
    flash[:alert] = "凍結中です"
    redirect_to new_user_registration_path
  end
  end

  protected
    def after_sign_in_path_for(resource)
      public_top_path
    end

    def after_sign_out_path_for(resource_or_scope)
      new_user_session_path
    end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
