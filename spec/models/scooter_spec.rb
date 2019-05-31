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
