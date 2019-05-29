# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "json"

class BirdData 
    file = File.read('jsonresponses/birdresponse.json')
    @data_hash = JSON.parse(file)["birds"]
    
    def self.seed_scooter
        @data_hash.each do |scooter|
            Bird.create(company: "Bird",
                latitude: scooter["location"]["latitude"], 
                longitude: scooter["location"]["longitude"], 
                battery_level: scooter["battery_level"])
        end 
    end 
end 

class LimeData 
    file = File.read('jsonresponses/limeresponse.json')
    @data_hash = JSON.parse(file)["data"]["attributes"]["bikes"]

    def self.seed_scooter
        @data_hash.each do |scooter|
            Lime.create(company: "Lime", 
                latitude: scooter["attributes"]["latitude"], 
                longitude: scooter["attributes"]["longitude"], 
                battery_level: scooter["attributes"]["battery_level"])
        end 
    end 
end 

Bird.destroy_all
Lime.destroy_all

BirdData.seed_scooter
LimeData.seed_scooter