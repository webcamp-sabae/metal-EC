class AddColumnCds < ActiveRecord::Migration[5.2]
  def change
  	add_column :cds, :cd_image_id, :text
  end
end
