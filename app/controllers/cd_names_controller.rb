class CdNamesController < ApplicationController
  def index
    @cd_names = Cd.order(:single_album_name).where("single_album_name like ?", "%#{params[:term]}%")
    render json: @cd_names.map(&:single_album_name)
  end
end
