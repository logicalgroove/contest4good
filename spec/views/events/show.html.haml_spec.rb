require 'spec_helper'

describe "events/show" do
  before(:each) do
    @event = assign(:event, stub_model(Event,
      :name => "Name",
      :subject => nil,
      :event_duration_in_minutes => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(//)
    rendered.should match(/1/)
  end
end
