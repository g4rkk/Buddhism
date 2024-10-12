class AddUniqueIndexToBooksNumber < ActiveRecord::Migration[7.0]
  def change
    add_index :books, :number, unique: true
  end
end
