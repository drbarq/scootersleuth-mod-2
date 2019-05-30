class Lime < ApplicationRecord
    geocoded_by [:latitude, :longitude]

    def self.closest
        Lime.near([Location.last.latitude, Location.last.longitude]).first(5)
    end 

    def self.merge_table # takes the first 5 entries in the returned results and creates new entries in the aggregated table
        Lime.closest.each do |lime_scoot|
            Scooter.create(
                company: lime_scoot.company, 
                latitude: lime_scoot.latitude, 
                longitude: lime_scoot.longitude, 
                battery_level: lime_scoot.battery_level
                )
        end 
    end 


end
