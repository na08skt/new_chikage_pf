class Public::LocationReportsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :new, :show, :destroy, :update, :create]
  AREA_ARRAY = [["北海道", "北海道"], ["東北", "東北"],["関東","関東"],["東海","東海"],
            ["甲信越","甲信越"],["北陸","北陸"],["関西","関西"],["中国（山陰山陽）","中国（山陰山陽）"],
            ["四国","四国"],["九州","九州"],["沖縄","沖縄"]]

  def new
    @location_report = LocationReport.new
  end

  def top
    gon.all_locations = LocationReport.all
    @users = User.page(params[:page]).all
    @location_reports = LocationReport.all
  end

  def create
    @location_report = LocationReport.new(location_report_params)
    @location_report.user_id = current_user.id
  if @location_report.save
    flash[:notice] = '投稿できました'
    redirect_to public_location_report_path(@location_report)
  else flash[:alert] = '未記入の項目、または文字数制限でエラーが起きています。'
    render :new
  end
  end

  def index
    @location_reports = LocationReport.page(params[:page]).per(10)
    @all_locations = LocationReport.all
    @area = AREA_ARRAY
    gon.all_locations = LocationReport.all
  end

  def search
    @results = LocationReport.search(params[:keyword])
    @results = @results.page(params[:page]).per(10)
    gon.searches = @results.page(params[:page]).per(10)
    @word = params[:keyword]
    @area = AREA_ARRAY
    render 'index'
  end

  def show
    @location_report = LocationReport.find(params[:id])
    @who = @location_report.user
    @favorites = Favorite.where(location_report_id: @location_report.id)
    @experiences = Experience.where(location_report_id: @location_report.id)
    @comment = Comment.new
    @comments = Comment.where(location_report_id: @location_report.id)
    @comments = @comments.page(params[:page]).per(6)
    gon.multi = [@location_report]
  end

  def edit
    @location_report = LocationReport.find(params[:id])
  end

  def update
    @location_report = LocationReport.find(params[:id])
    if @location_report.update(location_report_params)
      flash[:notice] = "正常に編集を完了することができました"
      redirect_to public_location_report_path(@location_report) || public_location_reports_path
    else
      flash[:alert] = "編集されたデータに関してエラーが発生しています。文字数などを確認してください"
      redirect_to edit_public_location_report_path(@location_report) || public_location_reports_path
    end
  end

  def destroy
    @location_report = LocationReport.find(params[:id])
    if @location_report.destroy
      flash[:notice] = "正常に削除ができました"
      redirect_to public_location_reports_path
    else
      flash[:alert] = "削除ができませんでした"
      redirect_to public_location_report_path || public_location_reports_path
    end
  end

  private

  def location_report_params
    params.require(:location_report).permit(:user_id, :comment_id, :title, :image,
    :area, :address, :latitude, :longitude, :date, :event, :body, :publication_status)
  end

end
