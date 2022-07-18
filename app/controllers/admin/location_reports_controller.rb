class Admin::LocationReportsController < ApplicationController
  # before_action :-----の後、userかadminで制限の対象を変更できる
  before_action :authenticate_admin!

  def top
    @users = User.all
    @location_reports = LocationReport.all
  end

  def index
  end

  def show
  end

  def edit
  end

end
