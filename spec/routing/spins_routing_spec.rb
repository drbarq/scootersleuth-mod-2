require "rails_helper"

RSpec.describe SpinsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/spins").to route_to("spins#index")
    end

    it "routes to #new" do
      expect(:get => "/spins/new").to route_to("spins#new")
    end

    it "routes to #show" do
      expect(:get => "/spins/1").to route_to("spins#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/spins/1/edit").to route_to("spins#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/spins").to route_to("spins#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/spins/1").to route_to("spins#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/spins/1").to route_to("spins#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/spins/1").to route_to("spins#destroy", :id => "1")
    end
  end
end
