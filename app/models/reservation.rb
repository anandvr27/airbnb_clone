require 'pry'
class Reservation < ActiveRecord::Base
	belongs_to :user
	belongs_to :listing
	
	validate :date_uniqness

	private
	def date_uniqness
		
		conditions = "((start_date BETWEEN :start_date AND :end_date) OR (end_date BETWEEN :start_date AND :end_date) OR (start_date <= :start_date AND end_date >= :end_date)) AND (listing_id == :listing_id)"

    	if Reservation.where(conditions, start_date: self.start_date, end_date: self.end_date, listing_id: self.listing_id).exists?
      		self.errors.add(:start_date, 'Date already taken')
      		# self.errors.add(:end_date, 'Date already taken')
    	end

	end
end
