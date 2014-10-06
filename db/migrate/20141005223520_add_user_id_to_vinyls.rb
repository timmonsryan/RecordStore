class AddUserIdToVinyls < ActiveRecord::Migration
  def up
  	add_column :vinyls, :user_id, :integer
  end

  def down
  	remove_column :vinyls, :user_id
  end
end
