require 'spec_helper'

describe "events/new" do
  before(:each) do
    assign(:event, stub_model(Event,
      :name => "MyString",
      :subject => nil,
      :event_duration_in_minutes => 1
    ).as_new_record)
  end

  it "renders new event form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", events_path, "post" do
      assert_select "input#event_name[name=?]", "event[name]"
      assert_select "input#event_subject[name=?]", "event[subject]"
      assert_select "input#event_event_duration_in_minutes[name=?]", "event[event_duration_in_minutes]"
    end
  end
end
