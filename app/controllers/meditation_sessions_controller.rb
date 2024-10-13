class MeditationSessionsController < ApplicationController
  before_action :authenticate_user!

  def new
    @meditation_session = MeditationSession.new
  end

  def create
    @meditation_session = current_user.meditation_sessions.build(meditation_session_params)

    # 自动设置一个默认的 meditation_guide (这里以 ID 1 为例)
    # 如果你有特定的逻辑来选择 guide，你可以调整这部分
    @meditation_session.meditation_guide = MeditationGuide.first # 或指定某个 ID

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
    params.require(:meditation_session).permit(:duration_seconds)
  end
end
