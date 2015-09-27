class AddBlessedToGearLists < ActiveRecord::Migration
  def change
    add_column :gear_lists, :blessed, :boolean, default: false
  end
end
