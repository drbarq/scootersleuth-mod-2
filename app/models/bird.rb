require 'uri'
require 'net/http'


class Bird < ApplicationRecord
    geocoded_by [:latitude, :longitude]


    def self.get_latest #api call to get the latest bird.  need tp update with latest location 
        
        uri = URI.parse("https://api.bird.co/bird/nearby?latitude=39.758596&longitude=-105.007265&radius=1000")
        request = Net::HTTP::Get.new(uri)
        request["Accept"] = "*/*"
        request["App-Version"] = "4.24.5"
        request["Authorization"] = "BIRD eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJBVVRIIiwidXNlcl9pZCI6ImUwMDIxZWFhLWFiZmEtNGExYy04ZjI1LTAzMDg4NzNmNmZhMCIsImRldmljZV9pZCI6ImMyNTlhMmU2LTA3NTQtNDgxZi05OGExLWJmOTQ1Y2QwYmEwMyIsImV4cCI6MTU5MDUzOTQzNn0.jC7f6bWP2vbNngFlmTrTQUEhHN_RDE71A_W0T78DDgM"
        request["Cache-Control"] = "no-cache"
        request["Connection"] = "keep-alive"
        request["Device-Id"] = "c259a2e6-0754-481f-98a1-bf945cd0ba03"
        request["Host"] = "api.bird.co"
        request["Location"] = "{\"latitude\":39.758292,\"longitude\":-105.007622,\"altitude\":500,\"accuracy\":100,\"speed\":-1,\"heading\":-1}"
        request["Postman-Token"] = "ddbf2231-43b6-4309-aab7-45bf9f7f69fa,ceaf7fcf-c5e8-40b7-b9c5-21d16bd2746b"
        request["User-Agent"] = "PostmanRuntime/7.11.0"
        request["Cookie"] = "__cfduid=ddc33f4510477e1aa82f855b71ed815091558999853"
        
        req_options = {
          use_ssl: uri.scheme == "https",
        }
        
        response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
          http.request(request)
        end

        @@jsonresponse = JSON.parse(response.body)["birds"]

        # this creates the json on the response.body 
        # need to parse through it 
        
        # response.code
        # response.body
        # byebug
    end 

    def self.seed_scooter
        @@jsonresponse.each do |scooter|
            Bird.create(company: "Bird",
                latitude: scooter["location"]["latitude"], 
                longitude: scooter["location"]["longitude"], 
                battery_level: scooter["battery_level"])
        end 
    end 



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
