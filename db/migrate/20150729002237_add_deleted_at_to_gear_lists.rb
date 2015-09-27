class AddDeletedAtToGearLists < ActiveRecord::Migration
  def change
    add_column :gear_lists, :deleted_at, :datetime
    add_index :gear_lists, :deleted_at
  end
end
