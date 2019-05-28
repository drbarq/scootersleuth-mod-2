class Scooter < ApplicationRecord
  $all_scooters = []

  Lime.each do |scooter|
    $all_scooters << scooter
  end

  Bird.each do |scooter|
    $all_scooters << scooter
  end

  # Lime.each do |scooter|
  #   @@all_scooters << scooter
  # end

end
