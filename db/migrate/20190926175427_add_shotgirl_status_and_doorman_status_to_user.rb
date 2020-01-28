class AddShotgirlStatusAndDoormanStatusToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :shotgirlStatus, :boolean, default: false
    add_column :users, :doormanStatus, :boolean, default: false
  end
end
