class Receipt < ApplicationRecord
  has_many :purchases
  accepts_nested_attributes_for :purchases
  belongs_to :user

  enum payment: { 銀行振込:1, クレジットカード:2, 代金引換:3 }
  enum status: { 未発送: 1, 発送済: 2 }

  # validates :ship, :shipping_address, presence: true

# クラスメソッド status情報のみ取得
  def self.status_select(status)
    list = self.select do |receipt|
      receipt.status == status
    end
    return list
  end

end
