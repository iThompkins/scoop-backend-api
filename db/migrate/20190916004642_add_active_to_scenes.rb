class AddActiveToScenes < ActiveRecord::Migration[5.2]
  def change
    add_column :scenes, :active, :boolean
  end
end
