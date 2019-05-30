### NEEDS SOME WORK, 3 TESTS NOT PASSING ###

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:attributes) do
    {
      first_name: "John",
      last_name: "Doe",
      email: "someemail@email.to"
    }
  end

  it "renders the show template" do
    user = User.create!(attributes)
    get :show, params: { id: user.id }
    expect(response).to render_template(:show)
  end

  describe "GET index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end
end
