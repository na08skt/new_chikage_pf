class Public::LocationReportsController < ApplicationController
  before_action :authenticate_user!

  def new
    @location_report = LocationReport.new
  end

  def top
    @location_reports = current_user.location_reports.page(params[:page]).per(3)
  end

  def create
    @location_report = LocationReport.new(location_report_params)
    @location_report.user_id = current_user.id
    @location_report.save
    redirect_to public_location_report_path(@location_report)
  end

  def index
    @location_reports = LocationReport.published
    @location_reports = LocationReport.page(params[:page]).per(10)
  end

  # search （検索）
  def search
    @searchs = LocationReport.search(params[:keyword])
    @keyword = params[:keyword]
    # エラー↓レンダーすると元々あったインスタンスのデータが飛んでいる
    # render index
  end

  def show
    @location_report = LocationReport.published
    @location_report = LocationReport.find(params[:id])
    @favorites = Favorite.where(location_report_id: @location_report.id)
    @experiences = Experience.where(location_report_id: @location_report.id)
    @comment = Comment.new
    @comments = Comment.all
    gon.location_report = @location_report
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
