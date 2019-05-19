class Receipt < ApplicationRecord
  belongs_to :user

  enum payment: {銀行振込:1, クレジットカード:2, 代金引換:3}
end
