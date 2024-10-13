class ChangeUserIdToBeNullableInMeditationGuides < ActiveRecord::Migration[7.0]
  def change
    change_column_null :meditation_guides, :user_id, true  # 允许 user_id 为空
  end
end
