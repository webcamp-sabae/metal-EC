class ChangeColumnToAllowNull < ActiveRecord::Migration[5.2]
  def change
    change_column :songs, :disc_num,   :integer, null: true
    change_column :songs, :song_title, :string, null: true
  end
end
