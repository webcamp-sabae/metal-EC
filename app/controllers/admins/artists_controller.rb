class Admins::ArtistsController < Admins::AdminsController
	def new
		@artist = Artist.new
		@artists = Artist.all
	end

	def create
		@artist = Artist.new(artist_params)
		@artist.save
		redirect_to new_admin_cd_path
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private
		def artist_params
			params.require(:artist).permit(:artist_name)
		end


end
