class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def destroy
    Comment.find(params[:id]).destroy
    if flash[:notice] = "管理者権限で削除できました。"
      redirect_to request.referrer || admin_location_reports_path
    else flash[:alert] = "削除できませんでした"
      redirect_to request.referrer || admin_location_reports_path
    end
  end

  private
  def comment_params
    params.requier(:comment).permit(:body)
  end

end
