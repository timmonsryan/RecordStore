class AddReferences < ActiveRecord::Migration
  def change
  	add_reference :songs, :vinyl
  	add_reference :songs, :artist

  	add_reference :vinyls, :artist
  end
end
