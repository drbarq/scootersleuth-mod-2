class User < ApplicationRecord
    has_many :favorites

    def full_name
      first_name + " " + last_name
    end
end
