class Public::CommentsController < ApplicationController
  before_action :authenticate_user!, only: [ :destroy, :update, :create]
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
    if comment.save
    flash[:notice] = 'コメントを残せました。'
    redirect_to request.referrer || public_location_reports_path
    else flash[:alert] = "入力に問題がありました。未記入や50文字以上は投稿できません"
      redirect_to request.referrer || public_location_reports_path
    end
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
