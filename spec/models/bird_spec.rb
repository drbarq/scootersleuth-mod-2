require 'rails_helper'

RSpec.describe Bird, type: :model do
  let(:attributes) do
    {
      company: "Bird",
      latitude: "100.00",
      longitude: "100.00",
      battery_level: "High"
    }
  end

  it "is considered valid" do
    expect(Bird.new(attributes)).to be_valid
  end
end
