class Purchase < ApplicationRecord
  belongs_to :receipt
  belongs_to :cd

end
