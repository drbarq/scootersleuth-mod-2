require 'rails_helper'

RSpec.describe "spins/show", type: :view do
  before(:each) do
    @spin = assign(:spin, Spin.create!(
      :company => "Company",
      :latitude => 2.5,
      :longitude => 3.5,
      :battery_level => "Battery Level"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Company/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/3.5/)
    expect(rendered).to match(/Battery Level/)
  end
end
