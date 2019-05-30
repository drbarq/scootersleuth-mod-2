require 'httparty'


class Jump < ApplicationRecord
    geocoded_by [:latitude, :longitude]

    def self.get_latest   # get the latest jump bikes based on last location entered
        @response = HTTParty.get('https://den.jumpbikes.com/opendata/free_bike_status.json')
        @data = JSON.parse(@response.body)["data"]["bikes"]
    end 
    
    def self.create_scooter    #create new jump bike objects with returned data
        Jump.get_latest.each do |bike|  
            Jump.create(company: "Jump", 
            latitude: bike["lat"], 
            longitude: bike["lon"], 
            battery_level: bike["jump_ebike_battery_level"])
        end
    end 

    def self.closest          #find the closest bikes to the user based on location gps info 
        Jump.create_scooter

        Jump.near([Location.last.latitude, Location.last.longitude]).first(5)
    end 

    def self.lat_array 
        Jump.closest.map do |scooter|
            scooter.latitude
        end 
    end 

    def self.lng_array 
        Jump.closest.map do |scooter|
            scooter.longitude
        end 
    end 

    def self.lat_lng_array 
        Jump.lat_array.zip(Jump.lng_array)
    end 

    def self.merge_table              # takes the first 5 entries in the returned closest results and creates new entries in the aggregated scooter table
        Jump.closest.each do |jump_scoot|
            Scooter.create(
                company: jump_scoot.company, 
                latitude: jump_scoot.latitude, 
                longitude: jump_scoot.longitude, 
                battery_level: jump_scoot.battery_level
                )
        end 
    end 

    def self.avg_battery_level 
        Jump.average(:battery_level).to_i
    end 

end
