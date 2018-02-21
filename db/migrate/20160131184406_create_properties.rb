class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.integer :user_id
      t.string :name
      t.text :address
      t.text :map_position
      t.string :property_type
      t.string :location
      t.string :city
      t.string :state
      t.string :country

      t.timestamps null: false
    end
  end
end
