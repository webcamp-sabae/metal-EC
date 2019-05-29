class Admins::SongsController < Admins::AdminsController
	def create
		@song = Song.new(song_params)
		if @song.save
		redirect_to new_admins_cd_path
		else
		@cd = Cd.new
     	 render "admins/cds/new"
   		end
   	end

   	private
		def song_params
			params.require(:song).permit(:song_title, :cd_id, :disc_num)
		end
end
