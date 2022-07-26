class Public::CommentsController < ApplicationController
  before_action :authenticate_user!
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
    flash[:notice] = 'コメントを残せました'
    redirect_to request.referrer || public_location_reports_path
    else flash[:alert] = "入力に問題がありました。未記入や30文字以上は投稿できません"
      redirect_to request.referrer || public_location_reports_path
    end
  end

  def destroy
    @location_report = LocationReport.find(params[:id])
    @comment = Comment.find(params[:id])
    if @comment.destroy
      flash[:notice] = "正常に削除することができました"
    redirect_to session[:previous_url] || request.referrer || public_location_reports_path
    else
      flash[:alert] = "正常に動作しませんでした"
      redirect_to public_location_report_path(@comment) || public_location_reports_path
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end


end
