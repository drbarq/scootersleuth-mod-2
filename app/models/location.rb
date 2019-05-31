require 'rest-client'
require 'json'
require 'mapquest'

class Location < ApplicationRecord
  has_many :favorites

  @@mapquest_key = Rails.application.credentials.mapquest

  @@mapquest = MapQuest.new(@@mapquest_key)

  def self.get_location(address)  #uses Mapquest to validate location and gps information
    @@data = @@mapquest.geocoding.address(address)
  end

  def self.create_location
    @@data.locations.each do |location|
      address = "#{location[:street]}, #{location[:adminArea5]}, #{location[:adminArea3]} #{location[:postalCode]}"
      lat = location[:latLng][:lat]
      lng = location[:latLng][:lng]
      Location.create(address: address, latitude: lat, longitude: lng)
    end
  end

end
