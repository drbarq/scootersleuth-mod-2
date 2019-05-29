class Bird < ApplicationRecord
    geocoded_by [:latitude, :longitude]
    def self.closest
        # pass in value of number of scooters needed
        Bird.first(5)
    end 

    def self.merge_table # takes the first 5 entries in the returned results and creates new entries in the aggregated table
        Bird.closest.each do |bird_scoot|
            Scooter.create(
                company: bird_scoot.company, 
                latitude: bird_scoot.latitude, 
                longitude: bird_scoot.longitude, 
                battery_level: bird_scoot.battery_level
                )
        end 
    end 

end
