class Jump < ApplicationRecord
    geocoded_by [:latitude, :longitude]


    def self.closest
        # pass in value of number of scooters needed
        byebug
        # lat = Location.last.latitude
        # lng = Location.last.longitude
        # cordinates = [lat, lng]

        # 
        # Jump.near([39.758596, -105.007265] , 1)
        # latitude: -104.99528166666667, longitude: 39.7498, battery_level: "99%", created_a

        Jump.first(5)
    end 

    # def self.merge_table # takes the first 5 entries in the returned results and creates new entries in the aggregated table
    #     Jump.closest.each do |lime_scoot|
    #         Scooter.create(
    #             company: lime_scoot.company, 
    #             latitude: lime_scoot.latitude, 
    #             longitude: lime_scoot.longitude, 
    #             battery_level: lime_scoot.battery_level
    #             )
    #     end 
    # end 



end
