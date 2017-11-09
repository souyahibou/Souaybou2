require 'rails_helper'

RSpec.describe "Gossips", type: :request do
  describe "GET /gossips" do
    it "works! (now write some real specs)" do
      get gossips_path
      expect(response).to have_http_status(200)
    end
  end
end
