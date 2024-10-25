class CreateBuddhistQuotes < ActiveRecord::Migration[7.0]
  def change
    create_table :buddhist_quotes do |t|
      t.string :content

      t.timestamps
    end
  end
end
