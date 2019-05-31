require 'rails_helper'

RSpec.describe Scooter, type: :model do
  let(:attributes) do
    {
      company: "Company",
      latitude: "100.00",
      longitude: "100.00",
      battery_level: "High"
    }
  end

  it "is considered valid" do
    expect(Scooter.new(attributes)).to be_valid
  end
end


describe 'Scooter' do
 before do
   @lab = Scooter.create(company: "Scooter")
 end

 it 'has a name' do
   expect(Scooter.find_by(company: "Scooter")).to eq(@lab)
 end

end
