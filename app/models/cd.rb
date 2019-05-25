class Cd < ApplicationRecord
  has_many :purchases
	belongs_to :artist
	belongs_to :genre
	belongs_to :label
	has_many :songs

end
