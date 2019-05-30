require 'rails_helper'

RSpec.describe Lime, type: :model do
  let(:attributes) do
    {
      company: "Lime",
      latitude: "100.00",
      longitude: "100.00",
      battery_level: "High"
    }
  end

  it "is considered valid" do
    expect(Lime.new(attributes)).to be_valid
  end
end
