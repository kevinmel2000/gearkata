class AddQuantityToGearListItem < ActiveRecord::Migration
  def change
    add_column :gear_list_items, :quantity, :integer, default: 1
  end
end
