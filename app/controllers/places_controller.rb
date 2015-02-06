class PlacesController < ApplicationController
  before_action :authenticate_user!

  def index
    @places = Place.paginate(page: params[:page], per_page: 5)
  end

  def new
    @place = Place.new
  end

  def create
    current_user.places.create(place_params)
    redirect_to root_path
  end

  def show
    @place = Place.find(params[:id])
  end

  def edit
    @place = Place.find(params[:id])
  end

  def update
    @place = Place.find(params[:id])
    @place.update_attributes(place_params)
    respond_to do |format|
      format.html { redirect_to root_path, notice: "Things change.. As do places. Well done!" }
    end
  end

  def destroy
    @place = Place.find(params[:id])
    @place.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Place was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def place_params
    params.require(:place).permit(:name, :description, :address)
  end

end
