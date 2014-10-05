class VinylsController < ApplicationController

	def index
		@vinyls = Vinyl.all
	end

	def show
		@vinyl = Vinyl.find(params[:id])
	rescue ActiveRecord::RecordNotFound
		flash[:notice] = "That vinyl doesn't exist."
		redirect_to root_path
	end

	def show_artist
		@vinyl = Vinyl.find(params[:id])
		@vinyls = Vinyl.where(artist: @vinyl.artist)
	end

	def new
		@vinyl = Vinyl.new
	end

	def create
		@vinyl = Vinyl.new(vinyl_params)
		if @vinyl.save
			redirect_to vinyls_path, notice: "#{@vinyl.album} by #{@vinyl.artist} has been added to your collection!"
		else
			render 'new', notice: "Vinyl not added."
		end
	end

	def edit
		@vinyl = Vinyl.find(params[:id])
	end

	def update_attributes
		@vinyl = Vinyl.find(params[:id])
		@vinyl.update_attributes(vinyl_params)
		redirect_to vinyls_path
	end

	def destroy
		@vinyl = Vinyl.find(params[:id])
		@vinyl.destroy

		respond_to do |format|
			format.html { flash.now[:success] = "Vinyl has been destroyed."
							redirect_to vinyls_path }
			format.js {render nothing: true }
		end
	end

	def detail
		@vinyls = Vinyl.all
	end

	private
		def vinyl_params
			params.require(:vinyl).permit(:album, :artist, :year, :genre, :cover)
		end
end
