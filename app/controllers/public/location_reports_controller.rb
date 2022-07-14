class Public::LocationReportsController < ApplicationController
  before_action :authenticate_user!

  def new
    @location_report = LocationReport.new
  end

  def create
    @location_report = LocationReport.new(location_report_params)
    @location_report.user_id = current_user.id
    @location_report.save
      redirect_to public_location_report_path(@location_report)
  end

  def index
    @location_reports = LocationReport.page(params[:page]).per(10)
  end

  def show
    @location_report = LocationReport.find(params[:id])
    @comment = Comment.new
    @comments = Comment.all
  end

  def edit
    @location_report = LocationReport.find(params[:id])
  end

  def update
    @location_report = LocationReport.find(params[:id])
    @location_report.update(location_report_params)
    redirect_to public_location_report_path(@location_report) || public_location_reports
  end

  def destroy
    @location_report = LocationReport.find(params[:id])
    @location_report.destroy
    redirect_to public_location_reports_path
  end

  private

  def location_report_params
    params.require(:location_report).permit(:user_id, :comment_id, :title,
    :area, :address, :latitude, :longitude, :date, :event, :body, :publication_status)
  end

end
