class Public::CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :destroy, :update, :create]
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def edit
    @comment = Comment.find(params[:id])
    session[:previous_url] = request.referer
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    redirect_to session[:previous_url]
  end

  def create
    location_report = LocationReport.find(params[:location_report_id])
    comment = current_user.comments.new(comment_params)
    # commentのlocation_report_idカラムに代入するための記述
    comment.location_report_id = location_report.id
    comment.save
    redirect_to request.referrer || public_location_reports_path
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to session[:previous_url] || public_location_reports_path
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end


end
