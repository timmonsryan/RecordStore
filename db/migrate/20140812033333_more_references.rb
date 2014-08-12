class MoreReferences < ActiveRecord::Migration
  def change
  	remove_column :vinyls, :artist

  	rename_column :vinyls, :album, :name
  end
end
