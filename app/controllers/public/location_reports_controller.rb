class Public::LocationReportsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @location_reports = LocationReport.new
  end
  
  def create
    @location_reports = LocationReport.new(location_report_params)
    if @location_report.save
      redirect_to public_location_report_path(@location_report)
    else
      
    end
  end

  def index
  end

  def show
  end

  def edit
  end
  
  def update
    
  end
  
  private
  
  def location_report
    params.requier(:location_report).permit(:user_id, :comment_id, :title, 
    :area, :address, :latitude, :longitude, :date, :event, :body, :publication_status)
  end
  
end
