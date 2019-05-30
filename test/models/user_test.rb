require 'test_helper'

class UserTest < ActiveSupport::TestCase
  describe User do
    let(:attributes) do
      {
        first_name: "John",
        last_name: "Doe",
        email: "someemail@email.to"
      }
    end

    it "is considered valid" do
      expect(User.new(attributes)).to be_valid
    end
  end
end
