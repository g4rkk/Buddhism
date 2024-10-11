class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :sect
      t.string :file
      t.integer :number, null: false

      t.timestamps
    end
    add_index :books, :number, unique: true
  end
end