class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.integer :cd_id, foreign_key: true
	  t.integer :disc_num, null: false
	  t.string :song_title, index: true, null: false
      t.timestamps
    end
  end
end
