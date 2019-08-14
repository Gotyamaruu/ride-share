class CreateShares < ActiveRecord::Migration[5.2]
  def change
    create_table :shares do |t|
      t.integer :prefecture_id
      t.integer :human_id
      t.integer :distance_id
      t.integer :elevation_id
      t.timestamps
    end
  end
end
