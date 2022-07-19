class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def edit
    @comment = Comment.find(params[:id])
    session[:previous_url] = request.referer
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to session[:previous_url] || admin_location_reports_path
  end

  private
  def comment_params
    params.requier(:comment).permit(:body)
  end

end
