class ChangeAmountColumnOnPurchases < ActiveRecord::Migration[5.2]
  def change
    change_column_null :purchases, :amount, false, 0
  end
end
