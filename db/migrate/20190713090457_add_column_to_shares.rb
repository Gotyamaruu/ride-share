class AddColumnToShares < ActiveRecord::Migration[5.2]
  def change
    add_column :shares, :remarks, :text
  end
end
