class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def destroy
    Comment.find(params[:id]).destroy
    flash[:notice] = "管理者権限で削除できました。"
    redirect_to admin_location_reports_path
  end

  private
  def comment_params
    params.requier(:comment).permit(:body)
  end

end
