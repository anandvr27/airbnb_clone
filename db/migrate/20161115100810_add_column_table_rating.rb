class AddColumnTableRating < ActiveRecord::Migration
  def change
  	add_column :ratings, :comments, :text
  	add_column :ratings, :star_rating, :integer
  end
end
