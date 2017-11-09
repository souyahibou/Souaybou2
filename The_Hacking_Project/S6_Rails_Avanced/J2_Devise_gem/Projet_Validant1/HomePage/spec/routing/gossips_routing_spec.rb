require "rails_helper"

RSpec.describe GossipsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/gossips").to route_to("gossips#index")
    end

    it "routes to #new" do
      expect(:get => "/gossips/new").to route_to("gossips#new")
    end

    it "routes to #show" do
      expect(:get => "/gossips/1").to route_to("gossips#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/gossips/1/edit").to route_to("gossips#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/gossips").to route_to("gossips#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/gossips/1").to route_to("gossips#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/gossips/1").to route_to("gossips#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/gossips/1").to route_to("gossips#destroy", :id => "1")
    end

  end
end
