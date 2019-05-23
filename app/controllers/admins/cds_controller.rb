class Admins::CdsController < Admins::AdminsController

	before_action :set_cds, only: [:show, :edit, :update, :destroy]

	def new
		@cd = Cd.new
		@artist = Artist.new
		# @song = Song.new
		@cd.songs.build
	end

	def index
		@cds = Cd.all
	end

	def show

	end

	def edit
	end


	def create
		@cd = Cd.new(cd_params)
		@cd.save
		redirect_to new_admins_cd_path
	end

	def update
  	if @cd.update(cd_params)
  	   redirect_to admins_cd_path(@cd.id), notice: "cd was successfully updated."
    else render :edit
   end
	end

	def destroy
  	@cd.destroy
  	redirect_to admins_cds_path, notice: "cd was successfully destroyed"
	end


	private

		def set_cds
			@cd = Cd.find(params[:id])
		end

		def cd_params
			params.require(:cd).permit(:artist_id, :label_id, :genre_id, :release,
			 :price, :stock, :single_album_name, :cd_image,
			 songs_attributes: [:id, :disc_num, :song_title, :_destroy])
		end

end
