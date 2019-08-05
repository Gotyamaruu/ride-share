class UsersController < ApplicationController
  def show
    @name = current_user.name
    @shares = Share.where(user_id: current_user.id).page(params[:page]).per(5).order("created_at DESC")
  end
end
