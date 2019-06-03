require 'rails_helper'

RSpec.describe "spins/edit", type: :view do
  before(:each) do
    @spin = assign(:spin, Spin.create!(
      :company => "MyString",
      :latitude => 1.5,
      :longitude => 1.5,
      :battery_level => "MyString"
    ))
  end

  it "renders the edit spin form" do
    render

    assert_select "form[action=?][method=?]", spin_path(@spin), "post" do

      assert_select "input[name=?]", "spin[company]"

      assert_select "input[name=?]", "spin[latitude]"

      assert_select "input[name=?]", "spin[longitude]"

      assert_select "input[name=?]", "spin[battery_level]"
    end
  end
end
