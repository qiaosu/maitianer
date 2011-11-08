require "spec_helper"

describe BabiesController do
  describe "routing" do

    it "routes to #index" do
      get("/babies").should route_to("babies#index")
    end

    it "routes to #new" do
      get("/babies/new").should route_to("babies#new")
    end

    it "routes to #show" do
      get("/babies/1").should route_to("babies#show", :id => "1")
    end

    it "routes to #edit" do
      get("/babies/1/edit").should route_to("babies#edit", :id => "1")
    end

    it "routes to #create" do
      post("/babies").should route_to("babies#create")
    end

    it "routes to #update" do
      put("/babies/1").should route_to("babies#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/babies/1").should route_to("babies#destroy", :id => "1")
    end

  end
end
