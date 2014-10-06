class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.create(user_params)
  	flash[:success] = "You have registered for RecordStore!"
    flash[:notice] = "Some sample albums have been added for you to play around with."
    session[:user_id] = @user.id
    create_sample_albums
  	redirect_to home_path
  end

  def edit
    @user = User.find(params[:id])
  end

  private
  	def user_params
  		params.require(:user).permit(:email, :name, :password, :password_confirmation)
  	end

    def create_sample_albums
      @user.vinyls.create(cover: 'http://upload.wikimedia.org/wikipedia/en/2/2a/Carpenters_%28Carpenters_album%29.jpg',
             artist: 'Carpenters',
             album: 'Carpenters',
             genre: 'Soft Rock',
             year: 1971)
      @user.vinyls.create(cover: 'http://cobaltandcalcium.com/new/wp-content/uploads/2012/09/good-apollo.jpg',
             artist: 'Coheed and Cambria',
             album: 'Good Apollo, I\'m Burning Star IV, Volume One: From Fear Through the Eyes of Madness',
             genre: 'Rock',
             year: 2005)
      @user.vinyls.create(cover: 'http://1.bp.blogspot.com/-0wSIEG7-mbw/TzLpzKuajaI/AAAAAAAABTU/Iryl4GB0A4o/s1600/Jim+Croce+Greatest+Hits.jpg',
             artist: 'Jim Croce',
             album: 'Greatest Hits',
             genre: 'Singer-Songwriter',
             year: 1974)
      @user.vinyls.create(cover: 'http://upload.wikimedia.org/wikipedia/en/e/ec/JohnnyCashIWalkTheLine.jpg',
             artist: 'Johnny Cash',
             album: 'I Walk the Line',
             genre: 'Country',
             year: 1971)
      @user.vinyls.create(cover: 'http://upload.wikimedia.org/wikipedia/en/d/d7/ACDC-LetThereBeRock.jpg',
             artist: 'AC/DC',
             album: 'Let There Be Rock',
             genre: 'Hard Rock',
             year: 1977)
      @user.vinyls.create(cover: 'http://cdn.stereogum.com/files/2010/12/Agalloch-Marrow-Of-The-Spirit.jpg',
             artist: 'Agalloch',
             album: 'Marrow of the Spirit',
             genre: 'Black Metal',
             year: 2010)
    end
end
