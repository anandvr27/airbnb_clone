class Amenity < ActiveRecord::Base
	has_many :listing_amenity
	has_many :listings, through: :listing_amenity
end
