class AddTokenToGearLists < ActiveRecord::Migration
  def change
    add_column :gear_lists, :api_token, :string, limit: 16
  end
end
