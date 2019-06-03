class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]

  def index
    @locations = Location.all
  end

  def show
    @closest_scooters = Scooter.populate_scooters


    @bird_battery = Bird.avg_battery_level
    @lime_battery = Lime.avg_battery_num
    @jump_battery = Jump.avg_battery_level
    @spin_battery = "information unavailable"

    @num_of_bird = Bird.all.length
    @num_of_lime = Lime.all.length
    @num_of_jump = Jump.all.length
    @num_of_spin = Spin.all.length

    @birds = Bird.lat_lng_array
    @limes = Lime.lat_lng_array
    @jumps = Jump.lat_lng_array
    @spins = Spin.lat_lng_array

    @location_lat = Location.last.latitude
    @location_lng = Location.last.longitude

  end

  def new
    @location = Location.new
  end

  def edit
  end

  def create
    address = params["location"]["address"]
    mapquest_response = Location.get_location(address)
    geocode_quality = mapquest_response.response[:results][0][:locations][0][:geocodeQualityCode]

    respond_to do |format|
      if geocode_quality == "P1AAA"
        Location.create_location
        format.html { redirect_to location_path(:id => Location.last.id)}
      else
        format.html { redirect_to new_location_path, notice: 'Please enter a more accurate address'}
      end
    end
  end

  def update
    respond_to do |format|
      if @location.update(location_params)
        format.html { redirect_to @location, notice: 'Location was successfully updated.' }
        format.json { render :show, status: :ok, location: @location }
      else
        format.html { render :edit }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @location.destroy
    respond_to do |format|
      format.html { redirect_to locations_url, notice: 'Location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_location
      @location = Location.find(params[:id])
    end

    def location_params
      params.require(:location).permit(:name, :latitude, :longitude)
    end
end
