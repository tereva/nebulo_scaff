require "rails_helper"

RSpec.describe AppreciationsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/appreciations").to route_to("appreciations#index")
    end

    it "routes to #new" do
      expect(:get => "/appreciations/new").to route_to("appreciations#new")
    end

    it "routes to #show" do
      expect(:get => "/appreciations/1").to route_to("appreciations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/appreciations/1/edit").to route_to("appreciations#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/appreciations").to route_to("appreciations#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/appreciations/1").to route_to("appreciations#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/appreciations/1").to route_to("appreciations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/appreciations/1").to route_to("appreciations#destroy", :id => "1")
    end

  end
end
