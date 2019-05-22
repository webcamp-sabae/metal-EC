class Cd < ApplicationRecord
  has_many :purchases
	belongs_to :artist
	belongs_to :genre
	belongs_to :label
	has_many :songs, inverse_of: :cd
  accepts_nested_attributes_for :songs, reject_if: :all_blank, allow_destroy: true

	attachment :cd_image
end
