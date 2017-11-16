require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :email => "Email",
      :phone => 2,
      :password => "Password"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Password/)
  end
end
