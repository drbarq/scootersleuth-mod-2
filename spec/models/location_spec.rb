require 'rails_helper'

RSpec.describe Location, type: :model do
  let(:attributes) do
    {
      address: "1234 Somewhere",
      latitude: "100.00",
      longitude: "100.00",
    }
  end

  it "is considered valid" do
    expect(Location.new(attributes)).to be_valid
  end
end
