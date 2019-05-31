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

describe 'Bird' do
 before do
   @lab = Bird.create(company: "Bird")
 end

 it 'has a name' do
   expect(Bird.find_by(company: "Bird")).to eq(@lab)
 end

end
