class Jump < ApplicationRecord
    geocoded_by [:latitude, :longitude]

    def self.closest 
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
