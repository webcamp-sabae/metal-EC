class Admins::CdsController < Admins::AdminsController

	def new
		@artist = Artist.new
		@artists = Artist.all
		@cd = Cd.new
	end

	def create
		@cd = Cd.new(cd_params)
		@cd.save
		logger.debug @cd.errors.to_yaml
		redirect_to new_admins_cd_path
	end


	private
		def cd_params
			params.require(:cd).permit(:artist_id, :label_id, :genre_id, :release, :price, :stock, :single_album_name)
		end

end
