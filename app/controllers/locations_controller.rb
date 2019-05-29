class LocationsController < ApplicationController

  def index
    byebug
  end

  def show
  end

  def new
    @location = Location.new
  end

  def create
    address = params["location"]["address"]
    mapquest_response = Location.get_location(address)
    byebug
    geocode_quality = mapquest_response.response[:results][0][:locations][0][:geocodeQualityCode]

    if  geocode_quality == "P1AAA"
      Location.create_location
      # greate a location objet with lat long and address
    else
      render :new
      # please enter a more accurate address
    end
  end

end
