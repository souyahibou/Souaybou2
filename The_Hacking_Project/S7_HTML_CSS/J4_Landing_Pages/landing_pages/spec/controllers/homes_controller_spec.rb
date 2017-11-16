require 'rails_helper'

RSpec.describe HomesController, type: :controller do

  describe "GET #checkr" do
    it "returns http success" do
      get :checkr
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #flynn" do
    it "returns http success" do
      get :flynn
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #sparks" do
    it "returns http success" do
      get :sparks
      expect(response).to have_http_status(:success)
    end
  end

end
