class CreateListingAmenities < ActiveRecord::Migration
  def change
    create_table :listing_amenities do |t|
    	t.integer :listing_id
    	t.integer :amenity_id
      t.timestamps
    end
  end
end
