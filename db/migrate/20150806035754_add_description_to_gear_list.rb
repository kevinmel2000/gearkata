class AddDescriptionToGearList < ActiveRecord::Migration
  def change
    add_column :gear_lists, :description, :text
  end
end
