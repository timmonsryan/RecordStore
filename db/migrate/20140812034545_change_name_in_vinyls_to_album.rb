class ChangeNameInVinylsToAlbum < ActiveRecord::Migration
  def change
  	change_column :vinyls, :name, :album
  end
end
