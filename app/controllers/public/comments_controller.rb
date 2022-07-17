class Public::CommentsController < ApplicationController
  def create
    location_report = LocationReport.find(params[:location_report_id])
    comment = current_user.comments.new(comment_params)
    # commentのlocation_report_idカラムに代入するための記述
    comment.location_report_id = location_report.id
    comment.save
    redirect_to request.referrer || public_location_reports_path
  end

  def destroy
    @location_report = LocationReport.find(params[:id])
    Comment.find(params[:id]).destroy
    redirect_to public_location_report_path(params[:location_report_id]) || public_location_reports_path
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
