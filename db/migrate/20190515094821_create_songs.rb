class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.integer :cd_id, foreign_key: true
	  t.integer :disc_num
	  t.string :song_title, index: true
      t.timestamps
    end
  end
end
