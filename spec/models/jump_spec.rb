require 'rails_helper'

RSpec.describe Jump, type: :model do
  let(:attributes) do
    {
      company: "Jump",
      latitude: "100.00",
      longitude: "100.00",
      battery_level: "High"
    }
  end

  it "is considered valid" do
    expect(Jump.new(attributes)).to be_valid
  end
end