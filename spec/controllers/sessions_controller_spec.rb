require 'spec_helper'

describe SessionsController do

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end

    it "should have the right title" do
      get 'new'
      response.should have_selector("title", :content => "Clorg | Sign in")
    end
  end
  describe "POST 'create'" do

    describe "invalid signin" do
      before(:each) do
        @attr = { :email => "email@example.com", :password => "invalid" }
      end

      it "should re-render the new page" do
        post :create, :session => @attr
        response.should render_template('new')
      end

      it "should have the right title" do
        post :create, :session => @attr
        response.should have_selector("title", :content => "Clorg | Sign in")
      end

      it "should have a flash.now message" do
        post :create, :session => @attr
        flash.now[:error].should =~ /invalid/i
      end
    end

    describe "with valid email and password" do
      before(:each) do
        @user = FactoryGirl.create(:user)
        @attr = { :email => @user.email, :password => @user.password }
      end

      it "should sign the user in" do
        post :create, :session => @attr
        #Fill in with tests a signed-in user
      end

      it "should redirect to the user show page" do
        post :create, :session => @attr
        response.should redirect_to(user_path(@user))
      end
    end

    describe "DELETE 'destroy'" do

      it "should sign a user out" do
        test_sign_in(FactoryGirl.create(:user))
        delete :destroy
        controller.should_not be_signed_in
        response.should redirect_to(root_path)
      end
    end

    describe "PUT 'update' " do

      before(:each) do
        @user = FactoryGirl.create(:user)
        test_sign_in(@user)
      end

      describe "failure" do
        before(:each) do
          @attr = { :email => "", :name => "", :pasword => "", :password_confirmation => "" }
        end

        it "should render the edit page" do
          put :update, :id => @user.id, :user => @attr
          response.should render_template('edit')
        end

        it "should have the right title" do
          put :update, :id => @user.id, :user => @attr
          response.should have_selector("title", :content => "Edit user")
        end
      end

      describe "success" do
        before(:each) do
          @attr = {:email => "new-email@t-online.de", :name => "New User Name", :password => "newpassword", :password_confirmation => "newpassword"}
        end

        it "should change the users attributes" do
          put :update, :id => @user.id, :user => @attr
          @user.reload
          @user.name.should == @attr[:name]
          @user.email.should == @attr[:email]
        end

        it "should redirect to the users show page" do
          put :update, :id => @user.id, :user => @attr
          response.should redirect_to(user_path(@user))
        end

        it "should have a flash message" do
          put :update, :id => @user.id, :user => @attr
          flash[:success].should = ~ /updated/
        end
      end
    end
  end
end
