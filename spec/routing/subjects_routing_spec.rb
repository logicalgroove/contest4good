require "spec_helper"

describe Teachers::SubjectsController do
  describe "routing" do

    it "routes to #index" do
      get("/teachers/subjects").should route_to("teachers/subjects#index")
    end

    it "routes to #new" do
      get("/teachers/subjects/new").should route_to("teachers/subjects#new")
    end

    it "routes to #show" do
      get("/teachers/subjects/1").should route_to("teachers/subjects#show", :id => "1")
    end

    it "routes to #edit" do
      get("/teachers/subjects/1/edit").should route_to("teachers/subjects#edit", :id => "1")
    end

    it "routes to #create" do
      post("/teachers/subjects").should route_to("teachers/subjects#create")
    end

    it "routes to #update" do
      put("/teachers/subjects/1").should route_to("teachers/subjects#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/teachers/subjects/1").should route_to("teachers/subjects#destroy", :id => "1")
    end

  end
end
