class SharesController < ApplicationController

  before_action :move_to_index, except: :index

  def index
    @shares = Share.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end

  def new
    @share = Share.new
  end

  def create
    Share.create(share_params)
  end

  private
  def share_params
    params.permit(:content, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end