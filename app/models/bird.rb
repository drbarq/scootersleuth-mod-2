class Bird < ApplicationRecord
    def self.closest
        # pass in value of number of scooters needed
        Bird.first(5)
    end 

    def self.merge_table # takes the first 5 entries in the returned results and creates new entries in the aggregated table
        Bird.closest.each do |bird_scoot|
            Scooter.create(
                company: lime_scoot.company, 
                latitude: lime_scoot.latitude, 
                longitude: lime_scoot.longitude, 
                battery_level: lime_scoot.battery_level
                )
        end 
    end 

end
