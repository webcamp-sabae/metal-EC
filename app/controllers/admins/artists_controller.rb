class Admins::ArtistsController < Admins::AdminsController

	before_action :set_artist, only: [:destroy, :update]

	def new
		@artist = Artist.new
	end

	def create
		@artist = Artist.new(artist_params)
			respond_to do |format|
			if @artist.save
				format.html { redirect_to  new_admins_cd_path, notice: 'Artist was successfully created.' }
		    # format.json { render :show, status: :created, location: @artist }
			else
				@artists = Artist.all
				@cd = Cd.new
	      format.html { render "admins/cds/new" }
	      # format.json { render json: @user.errors, status: :unprocessable_entity }
	   	end
   end
	end

	def index
		@artists = Artist.all
	end

	def edit
	end

	def update
	  respond_to do |format|
	    if @artist.update (artist_params)
	      format.html { redirect_to new_admins_cd_path, notice: 'artist was successfully updated.' }
	      format.json { render "admins/cds/new", status: :ok, location: @artist }
	    else
	      format.html { render "admins/cds/new" }
	      # format.json { render json: @artist.errors, status: :unprocessable_entity }
	    end
	  end
	end


	def destroy
		@artist.destroy
		redirect_to new_admins_cd_path
	end

	private

		def set_artist
			@artist = Artist.find(params[:id])
		end

		def artist_params
			params.require(:artist).permit(:artist_name)
		end


end
