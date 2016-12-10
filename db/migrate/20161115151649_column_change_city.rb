class ColumnChangeCity < ActiveRecord::Migration
  def change
  	change_column :cities, :name, :string
  end
end
