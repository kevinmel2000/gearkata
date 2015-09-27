class AddBlessedIndexes < ActiveRecord::Migration
  def change
    add_index :gear_lists, :blessed
    add_index :items,      :blessed
  end
end
