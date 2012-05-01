# == Schema Information
#
# Table name: messages
#
#  id             :integer         not null, primary key
#  userid         :integer
#  message        :text
#  conversationid :integer
#  created_at     :datetime        not null
#  updated_at     :datetime        not null
#

require 'spec_helper'

describe Message do
	before(:each) do
		@attr={:userid => 1, :message => "Testmessage", :conversationid => 1}
	end

	it "should create a new message" do
		Message.create!(@attr)
	end

	it "should not pass if empty message" do 
		empty_message = Message.new(@attr.merge(:message => ""))
		empty_message.should_not be_valid
	end

	it "should not pass if empty userid" do 
		empty_userid = Message.new(@attr.merge(:userid => ""))
		empty_userid.should_not be_valid
	end

	it "should not pass if empty conversationid" do 
		empty_conversationid = Message.new(@attr.merge(:conversationid => ""))
		empty_conversationid.should_not be_valid
	end

end
