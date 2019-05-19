class Othersaddress < ApplicationRecord
belongs_to :user

attr_writer :first_address, :last_address

  validates :othersaddress, format: { with: /\A\d{7}\z/ }
  validates :first_address, presence: true
  validates :last_address, presence: true

  def first_address
    @first_address || self.address[0..2] if self.address.present?
  end

  def last_address
    @last_address || self.address[3..6] if self.address.present?
  end

  def set_address
    self.address = [@first_address, @last_address].join
  end

end
