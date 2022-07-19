class Admin::LocationReportsController < ApplicationController
  # before_action :-----の後、userかadminで制限の対象を変更できる
  before_action :authenticate_admin!

  def top
    @users = User.all
    @location_reports = LocationReport.all
  end

  def index
    @location_reports = LocationReport.all
    @location_reports = LocationReport.page(params[:page]).per(10)
  end

  def show
    @location_report = LocationReport.find(params[:id])
    @comments = Comment.where(location_report_id: @location_report.id)
    session[:previous_url] = request.referer
  end

  def update
    @location_report = LocationReport.find(params[:id])
    @location_report.update(location_report_params)
    redirect_to session[:previous_url]
  end

  def destroy

  end

  private
  def location_report_params
    params.require(:location_report).permit(:report_status)
  end

end
