class LocationsController < ApplicationController

  def index
  end

  def show
    # take the most recent updated user and find the scooter preferences
    Lime.merge_table
    Bird.merge_table
    @closest_scooters = Scooter.all # acombination of all the closests scooters (only lime and bird so far)
  

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

    # if  geocode_quality == "P1AAA"
    #   Location.create_location
    #   redirect_to location_path(:id => Location.last.id)
    
    # else
    #   render :new, notice: "please enter a more accurate address"
    #   # pop up: please enter a more accurate address

    # end

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
