class MeditationSessionsController < ApplicationController
  before_action :authenticate_user!

  def new
    @meditation_session = MeditationSession.new
  end

  def create
    @meditation_session = current_user.meditation_sessions.build(meditation_session_params)

    # 仅当用户选择冥想指南时才进行关联
    if params[:meditation_guide_id].present?
      @meditation_session.meditation_guide = MeditationGuide.find(params[:meditation_guide_id])
    end

    # 将分钟转换为秒
    @meditation_session.duration_seconds *= 60

    if @meditation_session.save
      redirect_to user_path(current_user), notice: '冥想時間が正常に記録されました。'
    else
      render :new
    end
  end

  private

  def meditation_session_params
    params.require(:meditation_session).permit(:duration_seconds, :meditation_guide_id)
  end
end
