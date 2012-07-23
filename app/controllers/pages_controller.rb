class PagesController < ApplicationController
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
