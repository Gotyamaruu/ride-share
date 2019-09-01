class CreateShareImages < ActiveRecord::Migration[5.2]
  def change
    create_table :share_images do |t|
      t.references :share, null: false, foreign_key: true, type: :bigint
      t.string :image, null: false
      t.timestamps
    end
  end
end
