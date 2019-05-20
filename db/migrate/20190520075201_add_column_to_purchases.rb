class AddColumnToPurchases < ActiveRecord::Migration[5.2]
  def change
    add_column :purchases, :amount, :integer
  end
end
