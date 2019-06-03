require 'httparty'

class Spin < ApplicationRecord
  geocoded_by [:latitude, :longitude]

  def self.get_latest
    @response = HTTParty.get('https://web.spin.pm/api/gbfs/v1/denver/free_bike_status')
    @data = JSON.parse(@response.body)["data"]["bikes"]
  end

  def self.create_scooter
    Spin.get_latest.each do |scooter|
      Spin.create(
        company: "Spin",
        latitude: scooter["lat"],
        longitude: scooter["lon"],
        battery_level: nil
      )
    end
  end

  def self.closest
    Spin.create_scooter
    Spin.near([Location.last.latitude, Location.last.longitude]).first(10)
  end

  def self.lat_array
    Spin.closest.map {|scooter| scooter.latitude}
  end

  def self.lng_array
    Spin.closest.map {|scooter| scooter.longitude}
  end

  def self.lat_lng_array
    Spin.lat_array.zip(Spin.lng_array)
  end

  def self.merge_table
    Spin.closest.each do |spin_scooter|
      Scooter.create(
        company: spin_scooter.company,
        latitude: spin_scooter.latitude,
        longitude: spin_scooter.longitude,
        battery_level: spin_scooter.battery_level
      )
    end
  end
end
