require 'rails_helper'

RSpec.describe User, type: :model do
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

  let(:missing_name) { attributes.except(:first_name) }
  let(:missing_last_name) { attributes.except(:last_name) }
  let(:missing_email) { attributes.except(:email) }

  it "is invalid without a first name" do
    expect(User.new(missing_name)).not_to be_valid
  end

  it "is invalid with a last name" do
    expect(User.new(missing_last_name)).not_to be_valid
  end

  it "is invalid without an email" do
    expect(User.new(missing_email)).not_to be_valid
  end
end
