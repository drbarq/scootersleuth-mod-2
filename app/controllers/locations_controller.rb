class LocationsController < ApplicationController
 before_action :set_location, only: [:show, :edit, :update, :destroy]
  def index
    @locations = Location.all
  end

  def show
    # take the most recent updated user and find the closest scooters based on preferences
    @closest_scooters = Scooter.populate_scooters   #calls Scooter.populate_scooters on the Scooter controller

    @birds = Bird.lat_lng_array 
    @limes = Lime.lat_lng_array 
    @jumps = Jump.lat_lng_array 

    @bird_battery = Bird.avg_battery_level #returns a whole number
    @lime_battery = Lime.avg_battery_num   #returns a whole number
    @jump_battery = Jump.avg_battery_level #returns a whole number 

    @num_of_bird = Bird.all.length
    @num_of_lime = Lime.all.length
    @num_of_jump = Jump.all.length

    @birds = Bird.lat_lng_array
    @limes = Lime.lat_lng_array
    @jumps = Jump.lat_lng_array
    @location_lat = Location.last.latitude
    @location_lng = Location.last.longitude


  end

  def new
    @location = Location.new
  end

  # GET /locations/1/edit
  def edit
  end

  # POST /locations
  # POST /locations.json
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

  # PATCH/PUT /locations/1
  # PATCH/PUT /locations/1.json
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

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    @location.destroy
    respond_to do |format|
      format.html { redirect_to locations_url, notice: 'Location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params.require(:location).permit(:name, :latitude, :longitude)
    end
end
