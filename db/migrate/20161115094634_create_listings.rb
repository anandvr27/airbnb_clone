class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :property_type
      t.string :place_type
      t.string :description
      t.integer :guest_count
      t.integer :cost_per_night
      t.integer :city_id
      t.integer :locality_id
      t.text :address
      t.integer :user_id

      t.timestamps
    end
  end
end
