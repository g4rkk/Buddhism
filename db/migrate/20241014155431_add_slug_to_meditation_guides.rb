class AddSlugToMeditationGuides < ActiveRecord::Migration[7.0]
  def change
    add_column :meditation_guides, :slug, :string
  end
end
