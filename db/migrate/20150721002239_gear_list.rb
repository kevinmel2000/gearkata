class GearList < ActiveRecord::Migration
  def change
    create_table :gear_lists do |t|
      t.string :name,     null: false
      t.string :uuid,     null: false,    unique: true

      t.timestamps        null: false
    end

    add_index :gear_lists, :uuid, unique: true

    add_reference :gear_lists, :user, index: true, foreign_key: true
  end
end
