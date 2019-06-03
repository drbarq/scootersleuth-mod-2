require 'rails_helper'

RSpec.describe "spins/new", type: :view do
  before(:each) do
    assign(:spin, Spin.new(
      :company => "MyString",
      :latitude => 1.5,
      :longitude => 1.5,
      :battery_level => "MyString"
    ))
  end

  it "renders new spin form" do
    render

    assert_select "form[action=?][method=?]", spins_path, "post" do

      assert_select "input[name=?]", "spin[company]"

      assert_select "input[name=?]", "spin[latitude]"

      assert_select "input[name=?]", "spin[longitude]"

      assert_select "input[name=?]", "spin[battery_level]"
    end
  end
end
