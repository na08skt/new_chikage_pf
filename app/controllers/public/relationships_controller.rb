class Public::RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    following = current_user.relationships.build(follower_id: params[:user_id])
    following.save
    redirect_to request.referrer || public_users_path
  end

  def destroy
    following = current_user.relationships.find_by(follower_id: params[:user_id])
    following.destroy
    redirect_to  request.referrer || public_users_path
  end

  private
  def relationship_params
    params.require(:relationship).permit(:following_id, :follower_id)
  end

end
