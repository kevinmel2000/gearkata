class AddBlessedToItem < ActiveRecord::Migration
  def change
    add_column :items, :blessed, :boolean, default: false
  end
end
