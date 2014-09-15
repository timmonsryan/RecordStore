class RenameCoverPictureColumn < ActiveRecord::Migration
  def change
  	rename_column :vinyls, :CoverPicture, :cover
  end
end
