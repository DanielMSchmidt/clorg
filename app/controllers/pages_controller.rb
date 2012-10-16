class PagesController < ApplicationController
	skip_before_filter :require_login
	
  def home
    @title = "Hauptseite"
  end

  def contact
    @title = "Kontaktseite"
  end

  def about
    @title = "&Uuml;ber uns"
  end
end
