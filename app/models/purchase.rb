class Purchase < ApplicationRecord
  belongs_to :receipt
  belongs_to :cd

  def total_price
    self.purchese_price * self.amount
  end
end
