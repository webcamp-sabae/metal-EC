class AddColumnToCds < ActiveRecord::Migration[5.2]
  def change
    add_column :cds, :cd_comment, :text
  end
end
