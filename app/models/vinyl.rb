class Vinyl < ActiveRecord::Base
	validates :album, presence: true
	validates :artist, presence: true
	validates :year, numericality: true

	has_one :artist
	has_many :songs
end
