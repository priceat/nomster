class PlacesController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]

  def index
    @places = Place.paginate(page: params[:page], per_page: 5)
  end

  def new
    @place = Place.new
  end

  def create
    @place = current_user.places.create(place_params)
    if @place.valid?
      redirect_to root_path
    else
      render :new, :status => :unprocessable_entity
    end
  end

  def show
    @place = Place.find(params[:id])
  end

  def edit
    @place = Place.find(params[:id])

    if @place.user != current_user
    return render :text => 'No can do!', :status => :forbidden
  end
  end

  def update
    @place = Place.find(params[:id])
    if @place.user != current_user
    return render :text => 'Not Allowed', :status => :forbidden
    end
    @place.update_attributes(place_params)
    if @place.valid?
      respond_to do |format|
      format.html { redirect_to root_path, notice: "Things change.. As do places. Well done!" }
      end
    else
      render :new, :status => :unprocessable_entity
    end
  end

  def destroy
    @place = Place.find(params[:id])
    if @place.user != current_user
    return render :text => 'Not Allowed', :status => :forbidden
    end
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
