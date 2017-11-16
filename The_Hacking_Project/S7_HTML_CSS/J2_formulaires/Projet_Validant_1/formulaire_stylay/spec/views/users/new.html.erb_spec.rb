require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, User.new(
      :email => "MyString",
      :phone => 1,
      :password => "MyString"
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input#user_email[name=?]", "user[email]"

      assert_select "input#user_phone[name=?]", "user[phone]"

      assert_select "input#user_password[name=?]", "user[password]"
    end
  end
end
