class MeditationSessionsController < ApplicationController
  def create
    @session = current_user.meditation_sessions.build(meditation_session_params)
    if @session.save
      render json: { success: true }
    else
      render json: { success: false }, status: :unprocessable_entity
    end
  end

  private

  def meditation_session_params
    params.require(:meditation_session).permit(:meditation_guide_id, :duration_seconds)
  end
end