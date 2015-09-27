class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string  :name,            :null => false,     :limit => 255
      t.text    :description
      t.integer :default_amount,  :default => 1
      t.string  :uuid,            :null => false,     :limit => 255,    :unique => true
      t.boolean :locked,          :default => false
      t.string  :api_token,       :null => false,     :limit => 16,      :unique => true

      t.timestamps
    end

    add_index :items, :uuid, unique: true

    add_reference :items, :user, index: true, foreign_key: true
  end
end
