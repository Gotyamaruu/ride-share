class SharesController < ApplicationController

  before_action :move_to_index, except: :index
  before_action :set_share, only: [:show, :edit, :update]

  def index
    @shares = Share.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end

  def new
    @share = Share.new
  end

  def create
    Share.create(share_params)
  end

  def show
    @share = Share.find[params[:id]]
  end

  private
  def share_params
    params.permit(:content, :image, :human, :distance, :elevation, :remarks, :prefecture_id, :human_id).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def set_share
    @share = Share.find(params[:id])
  end
end