class Artist < ActiveRecord::Base
	validates :name, presence: true

	has_many :songs, :albums
end
