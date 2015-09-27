class AddSlugToGearList < ActiveRecord::Migration
  def change
    add_column :gear_lists, :slug, :string
    add_index :gear_lists, :slug, unique: true

    add_column :users, :slug, :string
    add_index :users, :slug, unique: true
  end
end
