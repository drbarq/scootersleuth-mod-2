class ScootersController < ApplicationController




  def index
    @users = User.all


  end
end
