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
			redirect_to vinyls_path, notice: "'#{@vinyl.album}' by #{@vinyl.artist} has been added to your collection!"
		else
			render new_vinyl_path, notice: "Vinyl not added."
		end
	end

	def edit
		@vinyl = Vinyl.find(params[:id])
		unless @vinyl.user == current_user && @vinyl.user
			flash[:error] = "You cannot edit albums that are not yours."
			redirect_to vinyls_path
		end 
	end

	def update
		@vinyl = Vinyl.find(params[:id])
		@vinyl.update_attributes(vinyl_params)
		redirect_to vinyls_path
	end

	def destroy
		@vinyl = Vinyl.find(params[:id])
		if @vinyl.user == current_user
			@vinyl.destroy
			flash[:notice] = "'#{@vinyl.album}' by #{@vinyl.artist} has been removed."
		else
			flash[:error] = "You cannot delete albums that are not yours."
		end
		redirect_to vinyls_path
	end

	def detail
		if session[:user_id]
			user = User.find(session[:user_id])
			@vinyls = user.vinyls.order(:album)
		else
			@vinyls = nil
		end
	end

	def list_preferred
		session[:index_preference] = "list"
		redirect_to vinyls_path
	end

	def detail_preferred
		session[:index_preference] = "detail"
		redirect_to vinyls_detail_path
	end

	private
		def vinyl_params
			params.require(:vinyl).permit(:album, :artist, :year, :genre, :cover)
		end

		def current_user
			User.find(session[:user_id]) if session[:user_id]
		end
end
