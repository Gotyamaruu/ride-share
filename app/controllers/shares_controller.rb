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
    @share = Share.new(share_params)
    if @share.save && new_image_params[:images][0] != ""
      new_image_params[:images].each do |image|
        @share.share_images.create(image: image, share_id: share.id)
      end
      redirect_to root_path
    end
  end

  def show
    @share = Share.find[params[:id]]
  end

  private
  def share_params
    params.permit(:content, :image, :remarks, :prefecture_id, :human_id,  :elevation_id, :distance_id).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def set_share
    @share = Share.find(params[:id])
  end

  def new_image_params
    params[:new_images].permit({images: []})
  end
end