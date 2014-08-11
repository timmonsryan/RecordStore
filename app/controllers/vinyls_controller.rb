class VinylsController < ApplicationController

	def index
	end

	def new
		@vinyl = Vinyl.new
	end

	def create
		@vinyl = Vinyl.new
	end
end
