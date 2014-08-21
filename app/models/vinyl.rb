class Vinyl < ActiveRecord::Base
	validates :album, presence: true
	validates :artist, presence: true
	validates :year, numericality: true, allow_nil: true

end
