class CreateExpeditionGearLists < ActiveRecord::Migration
  def change
    create_table :expedition_gear_lists do |t|
      t.timestamps null: false
    end

    add_reference :expedition_gear_lists, :expedition, index: true,  foreign_key: true
    add_reference :expedition_gear_lists, :gear_list,  index: true,  foreign_key: true
  end
end
