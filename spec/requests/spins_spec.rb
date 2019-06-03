require 'rails_helper'

RSpec.describe "Spins", type: :request do
  describe "GET /spins" do
    it "works! (now write some real specs)" do
      get spins_path
      expect(response).to have_http_status(200)
    end
  end
end
