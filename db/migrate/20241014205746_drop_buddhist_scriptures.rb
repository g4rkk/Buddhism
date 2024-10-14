class DropBuddhistScriptures < ActiveRecord::Migration[7.0]
  def change
    drop_table :buddhist_scriptures
  end
end
