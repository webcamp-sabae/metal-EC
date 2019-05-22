class Admins::CdsController < Admins::AdminsController

	def new
		@cd = Cd.new
		@artist = Artist.new
		@song = Song.new
		@cd.songs.build
	end

	def index
		@cds = Cd.all
	end

	def show
		@cd = Cd.find(params[:id])
		@song = Song.all
	end


	def create
		@cd = Cd.new(cd_params)
		@cd.save
		logger.debug @cd.errors.to_yaml
		redirect_to new_admins_cd_path
	end

	def update
	end


	private
		def cd_params
			params.require(:cd).permit(:artist_id, :label_id, :genre_id, :release,
			 :price, :stock, :single_album_name, :cd_image,
			 songs_attributes: [:disc_num, :song_title, :_destroy,:cd_id])
		end

end
