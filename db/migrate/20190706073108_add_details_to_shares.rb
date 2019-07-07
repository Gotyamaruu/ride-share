class AddDetailsToShares < ActiveRecord::Migration[5.2]
  def change
    add_column :shares, :content, :text
    add_column :shares, :image, :string
    add_column :shares, :user_id, :integer
  end
end
