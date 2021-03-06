class Scooter < ApplicationRecord

  def self.populate_scooters

    if User.last.bird
      Bird.merge_table
    end

    if User.last.lime
      Lime.merge_table
    end

    if User.last.jump
      Jump.merge_table
    end

    if User.last.spin
      Spin.merge_table
    end
    Scooter.all
  end

end
