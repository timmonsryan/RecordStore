class VinylsController < ApplicationController

	def index
	end

	def new
		@vinyl = Vinyl.new
	end

	def create
		@vinyl = Vinyl.create(vinyl_params)
		redirect_to(vinyls_path)
	end

	private
	def vinyl_params
		params.require(:vinyl).permit(:album, :artist, :year, :genre)
	end
end
