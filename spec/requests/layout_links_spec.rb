require 'spec_helper'

describe "LayoutLinks" do

  it "should have a Home page at '/' " do
    get '/'
    response.should have_selector('title', :content => "Clorg | Hauptseite")
  end

  it "should have a Contact page at '/contact' " do
    get '/contact'
    response.should have_selector('title', :content => "Clorg | Kontakt")
  end

  it "should have a About page at '/about' " do
    get '/about'
    response.should have_selector('title', :content => "Clorg | &Uuml;ber uns")
  end
end