class Cd < ApplicationRecord
  has_many :purchases
	belongs_to :artist
	belongs_to :genre
	belongs_to :label
	has_many :songs
	accepts_nested_attributes_for :songs, allow_destroy: true

	attachment :cd_image
end
