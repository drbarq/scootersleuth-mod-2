require 'net/http'
require 'uri'

class Lime < ApplicationRecord
    geocoded_by [:latitude, :longitude]

    def self.get_latest           #api call to get the latest lime scooters based on last location entered
        bound = ".2".to_f
        latitude = Location.last.latitude
        longitude = Location.last.longitude
        ne_lat = latitude - bound
        ne_lng = longitude - bound
        sw_lat = latitude + bound
        sw_lng = longitude + bound
        @key = Rails.application.credentials.postman_lime

        uri = URI.parse("https://web-production.lime.bike/api/rider/v1/views/map?ne_lat=#{ne_lat}&ne_lng=#{ne_lng}&sw_lat=#{sw_lat}&sw_lng=#{sw_lng}&user_latitude=#{latitude}&user_longitude=#{longitude}&zoom=16")
        request = Net::HTTP::Get.new(uri)
            request["Accept"] = "*/*"
            request["Authorization"] = "Bearer https://web-production.lime.bike/api/rider/v1/views/map?ne_lat=#{ne_lat}&ne_lng=#{ne_lng}&sw_lat=#{sw_lng}&sw_lng=#{sw_lng}&user_latitude=#{latitude}&user_longitude=#{longitude}&zoom=16'"
            request["Cache-Control"] = "no-cache"
            request["Connection"] = "keep-alive"
            request["Host"] = "web-production.lime.bike"
            request["Postman-Token"] = @key
            request["User-Agent"] = "PostmanRuntime/7.11.0"
            request["Cookie"] = "_limebike-web_session=NmdEdmpVU1pPelMwSUVucHVZL3FIbTZpcTEzVWo0TWZmVE9LUDNlVGlqZnErSDFvRjhVK3RPTEVJcUFvcXF5YnI2TCtxdXFQclpMakNJNUM2c0hGRlJCMGlMTWVHOTNRTjdXd041ZDgzR1pmQmdZMVo1QUp2YktielE0VVBRc2o2Vm5ucTdNL0FwOXRXb3NBVUFlam01L1IyTHloZjFnNkoxZTJMS1VQbk9wV3RlNDVOZHZ0bzhJTkd1VFZrdXVPWC9MT2ZoSkRnbCtITGtCRUdkYkxGSzNlOUJUZml1NWF2cW9oamF2Z1YrN1FieW1NOHlSRS9uODYyaGN5b0dWbVRhbnJwTXVST1IyTlE2bTNORkZRVi80czh5WURvODZJb0VNb2J2VEh6eUNIWklzMGZZOEVMeGIyRW9jWlIrTjV6YUpydW1GZk50Qm45L0VGUkhRTWVwanlzRU1LSHNGNFdkd1A5M1Z3aXE3KzBaSWRBVjlGMzZ2N3BpcjF4dUIwU0wwSnNEM2RUSnZkSHN0UXVZTVVCdzl5OWlQTG9FQmc1emJwcVVXNlRpaz0tLVVvT0tYZUZNa1RvMnhzWnlQSjhIZkE9PQ%3D%3D--1d95026cf852fab91cd84dbd71233d75fb90a5c6"

        req_options = {
            use_ssl: uri.scheme == "https",
        }

        response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
                        http.request(request)
                    end

        jsonresponse = JSON.parse(response.body)["data"]["attributes"]["bikes"]

    end

    def self.create_scooter     #create new lime scooter objects with returned data
        Lime.get_latest.each do |scooter|
            Lime.create(company: "Lime",
                latitude: scooter["attributes"]["latitude"],
                longitude: scooter["attributes"]["longitude"],
                battery_level: scooter["attributes"]["battery_level"])
        end
    end

    def self.closest             #find the closest scooters to the user based on location gps info
        Lime.create_scooter

        Lime.near([Location.last.latitude, Location.last.longitude]).first(10)
    end

    def self.lat_array
        Lime.closest.map {|scooter| scooter.latitude }
    end

    def self.lng_array
        Lime.closest.map {|scooter| scooter.longitude }
    end

    def self.lat_lng_array
        Lime.lat_array.zip(Lime.lng_array)
    end

    def self.merge_table          # takes the first 10 entries in the returned results and creates new entries in the aggregated table
        Lime.closest.each do |lime_scoot|
            Scooter.create(
                company: lime_scoot.company,
                latitude: lime_scoot.latitude,
                longitude: lime_scoot.longitude,
                battery_level: lime_scoot.battery_level
                )
        end
    end

    def self.avg_battery_level   #this returns a hash of the battery levels and count
        Lime.group(:battery_level).distinct.count
    end

    def self.avg_battery_num       # this returns a number for the average
        battery_score = 0
        high = 80
        med = 55
        low = 20

        Lime.avg_battery_level.each do |level|

            if level[0] == "high"
                battery_score += high * level[1]
            elsif level[0] == "medium"
                battery_score += med * level[1]
            elsif level[0] == "low"
                battery_score += low * level[1]
            end
        end

        if Lime.all.length > 0
            num = battery_score / Lime.all.length
        end
    end

end
