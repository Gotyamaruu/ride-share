class CreateShares < ActiveRecord::Migration[5.2]
  def change
    create_table :shares do |t|
      t.integer :prefecture_id
      t.integer :human_id
      t.timestamps
    end
  end
end
