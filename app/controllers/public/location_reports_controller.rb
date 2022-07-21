class Public::LocationReportsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :new, :show, :destroy, :update, :create]

  def new
    @location_report = LocationReport.new
  end

  def top
    @location_reports = current_user.location_reports.page(params[:page]).per(3)
  end

  def create
    @location_report = LocationReport.new(location_report_params)
    @location_report.user_id = current_user.id
  if @location_report.save
    flash[:notice] = '投稿できました、'
    redirect_to public_location_report_path(@location_report)
  else flash[:alert] = '未記入の項目があります。'
    render :new
  end
  end

  def index
    @location_reports = LocationReport.page(params[:page]).per(10)
    @all_locations = LocationReport.all
    gon.all_locations = LocationReport.all
  end

  def search
    @results = LocationReport.search(params[:keyword])
    @results = @results.page(params[:page]).per(10)
    gon.searches = LocationReport.page(params[:page]).per(10)
    @word = params[:keyword]
    render 'index'
  end

  def show
    @location_report = LocationReport.find(params[:id])
    @favorites = Favorite.where(location_report_id: @location_report.id)
    @experiences = Experience.where(location_report_id: @location_report.id)
    @comment = Comment.new
    @comments = Comment.where(location_report_id: @location_report.id)
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
    params.require(:location_report).permit(:user_id, :comment_id, :title, :image,
    :area, :address, :latitude, :longitude, :date, :event, :body, :publication_status)
  end

end
