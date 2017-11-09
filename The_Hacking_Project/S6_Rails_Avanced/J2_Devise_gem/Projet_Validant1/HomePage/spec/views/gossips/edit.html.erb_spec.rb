require 'rails_helper'

RSpec.describe "gossips/edit", type: :view do
  before(:each) do
    @gossip = assign(:gossip, Gossip.create!(
      :content => "MyText"
    ))
  end

  it "renders the edit gossip form" do
    render

    assert_select "form[action=?][method=?]", gossip_path(@gossip), "post" do

      assert_select "textarea#gossip_content[name=?]", "gossip[content]"
    end
  end
end
