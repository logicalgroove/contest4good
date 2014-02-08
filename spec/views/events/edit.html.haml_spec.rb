require 'spec_helper'

describe "events/edit" do
  before(:each) do
    @event = assign(:event, stub_model(Event,
      :name => "MyString",
      :subject => FactoryGirl.create(:subject),
      :event_duration_in_minutes => 1
    ))
  end

  it "renders the edit event form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", event_path(@event), "post" do
      assert_select "input#event_name[name=?]", "event[name]"
      assert_select "input#event_subject[name=?]", "event[subject]"
      assert_select "input#event_event_duration_in_minutes[name=?]", "event[event_duration_in_minutes]"
    end
  end
end
