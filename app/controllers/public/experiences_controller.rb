class Public::ExperiencesController < ApplicationController
before_action :authenticate_user!
  def create
    location_report = LocationReport.find(params[:location_report_id])
    experience = current_user.experiences.new(location_report_id: location_report.id)
    experience.save
    redirect_to request.referrer || root_path
  end

  def destroy
    location_report = LocationReport.find(params[:location_report_id])
    experience = current_user.experiences.find_by(location_report_id: location_report.id)
    experience.destroy
    redirect_to request.referrer || root_path
  end
end
