class CreateBuddhistSites < ActiveRecord::Migration[7.0]
  def change
    create_table :buddhist_sites do |t|
      t.string :name
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
