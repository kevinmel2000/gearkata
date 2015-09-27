class CreateGearListItemInfos < ActiveRecord::Migration
  def change
    create_table :gear_list_item_infos do |t|
      t.boolean   :checked, default: false

      t.timestamps null: false
    end

    add_reference :gear_list_item_infos, :gear_list_item, index: true, foreign_key: true
    add_reference :gear_list_item_infos, :user,           index: true, foreign_key: true
  end
end
