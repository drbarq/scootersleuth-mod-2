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

describe 'Jump' do
 before do
   @lab = Jump.create(company: "Jump")
 end

 it 'has a name' do
   expect(Jump.find_by(company: "Jump")).to eq(@lab)
 end

end
