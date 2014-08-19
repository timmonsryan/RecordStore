class VinylsController < ApplicationController

	def index
		@vinyls = Vinyl.all
	end

	def show
		@vinyl = Vinyl.find(params[:id])
	end

	def new
		@vinyl = Vinyl.new
	end

	def create
		@vinyl = Vinyl.new(vinyl_params)
		if @vinyl.save
			redirect_to vinyls_path, notice: "Vinyl added."
		else
			render 'new', notice: "Vinyl not added."
		end
	end

	def edit
		@vinyl = Vinyl.find(params[:id])
	end

	def update
		@vinyl = Vinyl.find(params[:id])
		@vinyl.update_attributes(vinyl_params)
		redirect_to vinyls_path
	end

	def destroy
		@vinyl = Vinyl.find(params[:id])
		@vinyl.destroy
		flash.now[:success] = "Vinyl has been destroyed."
		redirect_to vinyls_path
	end

	private
	def vinyl_params
		params.require(:vinyl).permit(:album, :artist, :year, :genre)
	end
end
