class ChangeMeditationGuideIdToBeNullableInMeditationSessions < ActiveRecord::Migration[7.0]
  def change
    change_column_null :meditation_sessions, :meditation_guide_id, true  # 允许 meditation_guide_id 为空
  end
end
