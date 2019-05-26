class Purchase < ApplicationRecord
  belongs_to :receipt
  belongs_to :cd

  def total_price
    self.purchase_price * self.amount
  end

  def active_user
    self.receipt.user_id
  end

end
