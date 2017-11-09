require 'rails_helper'

RSpec.describe "gossips/new", type: :view do
  before(:each) do
    assign(:gossip, Gossip.new(
      :content => "MyText"
    ))
  end

  it "renders new gossip form" do
    render

    assert_select "form[action=?][method=?]", gossips_path, "post" do

      assert_select "textarea#gossip_content[name=?]", "gossip[content]"
    end
  end
end
