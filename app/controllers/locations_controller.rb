class LocationsController < ApplicationController

  def index
  end

  def show
    # take the most recent updated user and find the scooter preferences
    
    if User.last.bird 
      Bird.merge_table
    end 

    if User.last.lime
      Lime.merge_table
    end 

    if User.last.jump 
      Jump.merge_table
    end 

    
    @closest_scooters = Scooter.all # acombination of all the closests scooters


    # grab the most recent scooters and put them in a table
    # query lime based on location
    # query bird based on location
    # scooter model will hold the api calls
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
