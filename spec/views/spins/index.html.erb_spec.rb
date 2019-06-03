require 'rails_helper'

RSpec.describe "spins/index", type: :view do
  before(:each) do
    assign(:spins, [
      Spin.create!(
        :company => "Company",
        :latitude => 2.5,
        :longitude => 3.5,
        :battery_level => "Battery Level"
      ),
      Spin.create!(
        :company => "Company",
        :latitude => 2.5,
        :longitude => 3.5,
        :battery_level => "Battery Level"
      )
    ])
  end

  it "renders a list of spins" do
    render
    assert_select "tr>td", :text => "Company".to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
    assert_select "tr>td", :text => "Battery Level".to_s, :count => 2
  end
end
