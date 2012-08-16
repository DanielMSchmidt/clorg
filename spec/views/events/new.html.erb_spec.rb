require 'spec_helper'

describe "events/new.html.erb" do
  before(:each) do
    assign(:event, stub_model(Event,
      :name => "MyString",
      :color => "MyString",
      :tag_id => 1,
      :user_id => 1
    ).as_new_record)
  end

  it "renders new event form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => events_path, :method => "post" do
      assert_select "input#event_name", :name => "event[name]"
      assert_select "input#event_color", :name => "event[color]"
      assert_select "input#event_tag_id", :name => "event[tag_id]"
      assert_select "input#event_user_id", :name => "event[user_id]"
    end
  end
end
