require 'spec_helper'

describe "events/edit.html.erb" do
  before(:each) do
    @event = assign(:event, stub_model(Event,
      :new_record? => false,
      :name => "MyString",
      :color => "MyString",
      :tag_id => 1,
      :user_id => 1
    ))
  end

  it "renders the edit event form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => event_path(@event), :method => "post" do
      assert_select "input#event_name", :name => "event[name]"
      assert_select "input#event_color", :name => "event[color]"
      assert_select "input#event_tag_id", :name => "event[tag_id]"
      assert_select "input#event_user_id", :name => "event[user_id]"
    end
  end
end
