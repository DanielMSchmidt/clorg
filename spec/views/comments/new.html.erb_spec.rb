require 'spec_helper'

describe "comments/new.html.erb" do
  before(:each) do
    assign(:comment, stub_model(Comment,
      :content => "",
      :user_id => "",
      :post_id => ""
    ).as_new_record)
  end

  it "renders new comment form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => comments_path, :method => "post" do
      assert_select "input#comment_content", :name => "comment[content]"
      assert_select "input#comment_user_id", :name => "comment[user_id]"
      assert_select "input#comment_post_id", :name => "comment[post_id]"
    end
  end
end
