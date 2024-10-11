class CreateMeditationSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :meditation_sessions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :meditation_guide, null: false, foreign_key: true
      t.integer :duration_seconds

      t.timestamps
    end
  end
end
