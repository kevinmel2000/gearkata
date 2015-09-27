class CreateExpeditions < ActiveRecord::Migration
  def change
    create_table :expeditions do |t|
      t.string  :name,          null: false, limit: 255
      t.text    :description
      t.string  :uuid,          null: false, limit: 255, unique: true
      t.string  :slug,                       limit: 255, unique: true
      t.boolean :blessed,                                               default: false

      t.timestamps null: false
    end

    add_index :expeditions, :uuid,    unique: true
    add_index :expeditions, :slug,    unique: true
    add_index :expeditions, :blessed

    add_reference :expeditions, :user, index: true, foreign_key: true
  end
end
