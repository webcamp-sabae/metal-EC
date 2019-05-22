class Admins::CdsController < Admins::AdminsController

	def new
		@cd = Cd.new
		@artist = Artist.new
		@song = @cd.songs.build
	end

	def index
		@cds = Cd.all
	end

	def show
		@cd = Cd.find(params[:id])
		@songs = @cd.songs
	end


	def create
		@cd = Cd.new(cd_params)
		p "========================================"
		p "paramsを表示"
		p params
		p "cd_paramsを表示"
		p cd_params
		p @cd.songs
		p "========================================"
		@cd.save
		logger.debug @cd.errors.to_yaml
		redirect_to new_admins_cd_path
	end

	def update
	end


	private
		def cd_params
			params.require(:cd).permit(:artist_id, :label_id, :genre_id, :release,
			 :price, :stock, :single_album_name, :cd_image, songs_attributes: [:disc_num, :song_title, :_destroy, :cd_id, :id])
		end

end
