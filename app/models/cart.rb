class Cart < ApplicationRecord
  belongs_to :cd
  belongs_to :user
end
