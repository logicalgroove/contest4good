require "spec_helper"

describe Teachers::EventsController do
  describe "routing" do

    it "routes to #index" do
      get("/teachers/events").should route_to("teachers/events#index")
    end

    it "routes to #new" do
      get("/teachers/events/new").should route_to("teachers/events#new")
    end

    it "routes to #edit" do
      get("/teachers/events/1/edit").should route_to("teachers/events#edit", :id => "1")
    end

    it "routes to #create" do
      post("/teachers/events").should route_to("teachers/events#create")
    end

    it "routes to #update" do
      put("/teachers/events/1").should route_to("teachers/events#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/teachers/events/1").should route_to("teachers/events#destroy", :id => "1")
    end

  end
end
