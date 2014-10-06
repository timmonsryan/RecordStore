class Vinyl < ActiveRecord::Base
	belongs_to :user

	validates :album, presence: true, length: { maximum: 100 }
	validates :artist, presence: true, length: { maximum: 100 }
	validates :year, numericality: true, allow_nil: true
end