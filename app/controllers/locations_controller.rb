class LocationsController < ApplicationController

  def index
  end

  def show
    # take the most recent updated user and find the closest scooters based on preferences
    @closest_scooters = Scooter.populate_scooters   #calls Scooter.populate_scooters on the Scooter controller

    @bird_battery = Bird.avg_battery_level #returns a whole number
    @lime_battery = Lime.avg_battery_level #This returns a hash with the battery level and count
    @jump_battery = Jump.avg_battery_level #returns a whole number 
    
  end

  def new
    @location = Location.new
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

end
