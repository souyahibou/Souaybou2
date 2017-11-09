require 'rails_helper'

RSpec.describe "gossips/index", type: :view do
  before(:each) do
    assign(:gossips, [
      Gossip.create!(
        :content => "MyText"
      ),
      Gossip.create!(
        :content => "MyText"
      )
    ])
  end

  it "renders a list of gossips" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
