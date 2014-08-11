class CreateVinyls < ActiveRecord::Migration
  def change
    create_table :vinyls do |t|
      t.string :album
      t.string :artist
      t.integer :year
      t.string :genre

      t.timestamps
    end
  end
end
