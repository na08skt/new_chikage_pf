class Admin::LocationReportsController < ApplicationController
  before_action :authenticate_admin!
  AREA_ARRAY = [["北海道", "北海道"], ["東北", "東北"],["関東","関東"],["東海","東海"],
            ["甲信越","甲信越"],["北陸","北陸"],["関西","関西"],["中国（山陰山陽）","中国（山陰山陽）"],
            ["四国","四国"],["九州","九州"],["沖縄","沖縄"]]

  def top
    @users = User.all
    @location_reports = LocationReport.all
    gon.all_locations = @location_reports
  end

  def index
    @location_reports = LocationReport.page(params[:page]).per(10)
    gon.locations = @location_reports
  end

  def show
    @location_report = LocationReport.find(params[:id])
    @comments = Comment.where(location_report_id: @location_report.id)
    @comments = @comments.page(params[:page]).per(6)
    @favorites = Favorite.where(location_report_id: @location_report.id)
    @experiences = Experience.where(location_report_id: @location_report.id)
    session[:previous_url] = request.referer
    gon.location_report = [@location_report]
  end

  def update
    @location_report = LocationReport.find(params[:id])
    if @location_report.update(location_report_params)
      flash[:notice] = "変更できました"
      redirect_to session[:previous_url] || admin_location_reports_path
    else flash[:alert] = "変更できませんでした"
      redirect_to admin_location_report_path(@location_report) || admin_location_reports_path
    end
  end

  def search
    @area = AREA_ARRAY
    @results = LocationReport.search(params[:keyword])
    @results = @results.page(params[:page]).per(10)
    gon.searches = @results.page(params[:page]).per(10)
    @word = params[:keyword]
    render 'index'
  end

  private
  def location_report_params
    params.require(:location_report).permit(:report_status)
  end

end
