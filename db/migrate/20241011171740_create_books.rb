class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :sect
      t.integer :number
      t.string :file
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end