class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.integer :cd_id, null: false
	  t.integer :disc_num, null: false
	  t.string :song_title, null: false, index: true
      t.timestamps
    end
  end
   add_foreign_key :songs, :cds
end
