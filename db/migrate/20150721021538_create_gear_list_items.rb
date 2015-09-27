class CreateGearListItems < ActiveRecord::Migration
  def change
    create_table :gear_list_items do |t|
      t.timestamps null: false
    end

    add_reference :gear_list_items, :gear_list, index: true,  foreign_key: true
    add_reference :gear_list_items, :item,      index: true,  foreign_key: true
  end
end
