class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_meditation_data, only: [:show, :index]

  def index
    redirect_to user_path(current_user)
  end

  def show
    # @user, @total_meditation_time, @recent_sessions 已在 before_action 中设置
  end

  # 编辑用户的プロフィール
  def edit_profile
    @user = current_user
  end

  # 更新用户的プロフィール
  def update_profile
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = "プロフィールが更新されました。"
      redirect_to user_path(@user)
    else
      flash[:alert] = "プロフィールの更新に失敗しました。"
      render :edit_profile
    end
  end

  private

  def set_meditation_data
    @user = current_user
    total_seconds = @user.meditation_sessions.sum(:duration_seconds)
    @total_meditation_time_in_minutes = total_seconds / 60 # 用于图表的数据
    @total_meditation_time = format_time_in_minutes_and_hours(total_seconds) # 以小时和分钟格式显示
  
    # 确保 @recent_sessions 始终是一个数组，避免 nil 引发错误
    @recent_sessions = @user.meditation_sessions.order(created_at: :desc).limit(5) || []
  end
  
  def format_time_in_minutes_and_hours(total_seconds)
    minutes = total_seconds / 60
    hours = minutes / 60
    remaining_minutes = minutes % 60
    if hours > 0
      "#{hours}時間#{remaining_minutes}分"
    else
      "#{remaining_minutes}分"
    end
  end

  def user_params
    params.require(:user).permit(:username, :email)
  end  
end
