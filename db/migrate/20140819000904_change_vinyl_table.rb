class ChangeVinylTable < ActiveRecord::Migration
  def change
  	add_column :vinyls, :artist, :string
  	drop_table :artists
  	drop_table :songs
  end
end
