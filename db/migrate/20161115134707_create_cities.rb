class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
    	t.integer :name
      t.timestamps
    end
  end
end
