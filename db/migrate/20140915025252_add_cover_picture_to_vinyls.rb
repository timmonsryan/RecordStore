class AddCoverPictureToVinyls < ActiveRecord::Migration
  def change
    add_column :vinyls, :CoverPicture, :string
  end
end
