class Receipt < ApplicationRecord
  has_many :purchases
  belongs_to :user
  enum payment: { 銀行振込:1, クレジットカード:2, 代金引換:3 }
  enum status: { 未発送: 1, 発送済: 2, キャンセル: 3 }
end
