class Listing < ActiveRecord::Base
	belongs_to :user
	belongs_to :city
	belongs_to :locality
	has_many :reservations
	has_many :ratings
	has_many :listing_amenity
	has_many :amenities, through: :listing_amenity

	after_create :update_user_as_host

	#accepts_nested_attributes_for :reservations

	private
	def update_user_as_host
		@user = User.find(user.id)
		if @user.is_host != true	
			@user.update_attribute(:is_host,true)
		end
	end
end
