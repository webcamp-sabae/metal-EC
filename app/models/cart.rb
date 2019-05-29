class Cart < ApplicationRecord
  belongs_to :cd
  belongs_to :user


  validates :cd_id, presence: true
  validates :user_id, presence: true
  validates :amount, presence: true
end
