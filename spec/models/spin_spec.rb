require 'rails_helper'

RSpec.describe Spin, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

describe 'Spin' do
 before do
   @lab = Spin.create(company: "Spin")
 end

 it 'has a name' do
   expect(Spin.find_by(company: "Spin")).to eq(@lab)
 end
