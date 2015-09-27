class AddCategoryIdToGearList < ActiveRecord::Migration
  def change
    add_column :gear_lists, :category_id, :integer
  end
end
