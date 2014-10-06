class VinylsController < ApplicationController

	def index
		if session[:user_id]
			user = User.find(session[:user_id])
			@vinyls = user.vinyls.order(:album)
		else
			redirect_to signin_path
			flash[:notice] = "Please sign in."
		end
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
		@vinyl.user_id = current_user.id
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
		flash[:notice] = "Vinyl has been destroyed."

		respond_to do |format|
			format.html { redirect_to vinyls_path }
		end
	end

	def detail
		if session[:user_id]
			user = User.find(session[:user_id])
			@vinyls = user.vinyls.order(:album)
		else
			@vinyls = nil
		end
	end

	private
		def vinyl_params
			params.require(:vinyl).permit(:album, :artist, :year, :genre, :cover)
		end

		def current_user
			User.find(session[:user_id])
		end
end
