class CreateScenes < ActiveRecord::Migration[5.2]
  def change
    create_table :scenes do |t|
      t.float :long
      t.float :lat
      t.string :address
      t.references :user, foreign_key: true
      t.text :desc
      t.string :host
      t.string :type

      t.timestamps
    end
  end
end
