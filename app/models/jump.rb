class Jump < ApplicationRecord
    geocoded_by [:latitude, :longitude]

    def self.get_latest
        @response = HTTParty.get('https://den.jumpbikes.com/opendata/free_bike_status.json')
        @data = JSON.parse(@response.body)["data"]["bikes"]
    end 
    
    def self.create_scooter
        Jump.get_latest.each do |bike|  
            Jump.create(company: "Jump", 
            latitude: bike["lat"], 
            longitude: bike["lon"], 
            battery_level: bike["jump_ebike_battery_level"])
        end
    end 

    def self.closest 
        Jump.create_scooter

        Jump.near([Location.last.latitude, Location.last.longitude]).first(5)
    end 

    def self.merge_table # takes the first 5 entries in the returned results and creates new entries in the aggregated table
        Jump.closest.each do |jump_scoot|
            Scooter.create(
                company: jump_scoot.company, 
                latitude: jump_scoot.latitude, 
                longitude: jump_scoot.longitude, 
                battery_level: jump_scoot.battery_level
                )
        end 
    end 

end
