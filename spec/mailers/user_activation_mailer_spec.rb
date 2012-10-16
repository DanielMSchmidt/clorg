require "spec_helper"

describe UserActivationMailer do
  describe "activation_needed_email" do
    let(:mail) { UserActivationMailer.activation_needed_email }

    it "renders the headers" do
      mail.subject.should eq("Activation needed email")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

  describe "activation_success_email" do
    let(:mail) { UserActivationMailer.activation_success_email }

    it "renders the headers" do
      mail.subject.should eq("Activation success email")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
