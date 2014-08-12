class MakeVinylsSimpleAgain < ActiveRecord::Migration
  def change
  	remove_column :vinyls, :artist_id
  	add_column :vinyls, :artist, :string
  end
end
