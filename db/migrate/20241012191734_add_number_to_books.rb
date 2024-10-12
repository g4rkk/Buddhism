class AddNumberToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :number, :integer
  end
end
