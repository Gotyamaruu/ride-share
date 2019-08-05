class AddColumnToShares < ActiveRecord::Migration[5.2]
  def change
    add_column :shares, :human, :string
    add_column :shares, :distance, :string
    add_column :shares, :elevation, :string
    add_column :shares, :remarks, :text
  end
end
