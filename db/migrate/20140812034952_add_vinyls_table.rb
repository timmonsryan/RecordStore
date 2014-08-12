class AddVinylsTable < ActiveRecord::Migration
  def change
  	create_table "vinyls", force: true do |t|
	    t.string   "album"
	    t.string "artist"
	    t.integer "year"
	    t.string "genre"
	    t.datetime "created_at"
	    t.datetime "updated_at"
  	end
  end
end
