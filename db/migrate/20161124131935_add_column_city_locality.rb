class AddColumnCityLocality < ActiveRecord::Migration
  def change
  	add_column :localities, :city_id, :integer
  end
end
