class AddTenderStatusToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :tender_status, :boolean, default: false
  end
end
