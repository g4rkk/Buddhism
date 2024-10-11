class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @total_meditation_time = @user.meditation_sessions.sum(:duration_seconds)
    @recent_sessions = @user.meditation_sessions.order(created_at: :desc).limit(5)
  end

  def show
  end

  def edit
  end
end
