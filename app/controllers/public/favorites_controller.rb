class Public::FavoritesController < ApplicationController
  before_action :authenticate_user!
  
  def favorites
    @user = User.find(params[:id])
    favorites= Favorite.where(user_id: @user.id).pluck(:location_report_id)
    @favorite_reports = LocationReport.find(favorites)
  end
  
  def create
    location_report = LocationReport.find(params[:location_report_id])
    favorite = current_user.favorites.new(location_report_id: location_report.id)
    favorite.save
    redirect_to request.referrer || root_path
  end

  def destroy
    location_report = LocationReport.find(params[:location_report_id])
    favorite = current_user.favorites.find_by(location_report_id: location_report.id)
    favorite.destroy
    redirect_to request.referrer || root_path
  end
end
