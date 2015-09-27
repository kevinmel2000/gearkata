class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string  :name,            :null => false,     :limit => 255
      t.text    :description
      t.string  :uuid,            :null => false,     :limit => 255,     :unique => true

      t.timestamps null: false
    end

    add_index :categories, :uuid, unique: true

    add_reference :categories, :user, index: true, foreign_key: true
  end
end
