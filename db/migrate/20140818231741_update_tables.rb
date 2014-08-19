class UpdateTables < ActiveRecord::Migration
  def change
  	remove_column :songs, :artist_id
  	add_column :artists, :vinyl_id, :integer
  	remove_column :vinyls, :artist
  end
end
