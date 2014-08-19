class Song < ActiveRecord::Base
	validates :name, presence: true

	belongs_to :vinyl
end
