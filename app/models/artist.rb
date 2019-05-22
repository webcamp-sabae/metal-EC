class Artist < ApplicationRecord
	has_many :cds
	validates :artist_name, presence: true
end
