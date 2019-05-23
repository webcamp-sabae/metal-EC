class Cd < ApplicationRecord
  has_many :purchases
	belongs_to :artist
	belongs_to :genre
	belongs_to :label
	has_many :songs, inverse_of: :cd
  accepts_nested_attributes_for :songs, reject_if: :all_blank, allow_destroy: true

	attachment :cd_image


  validates :artist_id, presence: true
  validates :genre_id, presence: true
  validates :label_id, presence: true
  validates :single_album_name, presence: true
  validates :release, presence: true
  validates :price, presence: true
  validates :stock, presence: true

end
