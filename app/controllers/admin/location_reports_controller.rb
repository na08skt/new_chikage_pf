class Admin::LocationReportsController < ApplicationController
  # before_action :-----の後、userかadminで制限の対象を変更できる
  before_action :authenticate_admin!

  def top
    gon.all_locations = LocationReport.all
    @users = User.all
    @location_reports = LocationReport.all
  end

  def index
    @location_reports = LocationReport.page(params[:page]).per(10)
    @all_locations = LocationReport.all
    gon.all_locations = LocationReport.all
  end

  def show
    @location_report = LocationReport.find(params[:id])
    @comments = Comment.where(location_report_id: @location_report.id)
    @comments = @comments.page(params[:page]).per(5)
    session[:previous_url] = request.referer
  end

  def update
    @location_report = LocationReport.find(params[:id])
    @location_report.update(location_report_params)
    redirect_to session[:previous_url]
  end

  def destroy
  end

  def search
    @results = LocationReport.search(params[:keyword])
    @results = @results.page(params[:page]).per(10)
    gon.searches = LocationReport.page(params[:page]).per(10)
    @word = params[:keyword]
    render 'index'
  end

  private
  def location_report_params
    params.require(:location_report).permit(:report_status)
  end

end
