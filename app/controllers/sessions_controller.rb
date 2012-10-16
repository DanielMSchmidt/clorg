class SessionsController < ApplicationController
  skip_before_filter :require_login, :except => [:destroy]
  def new
    @title = "Sign in"
  end

  def create
    logger.debug "session create called"
    logger.debug params[:email]
    logger.debug params[:password]
    logger.debug params[:remember]

    if @user = login(params[:session][:email],params[:session][:password], params[:session][:remember])
      redirect_back_or_to(:messages, :notice => 'Login successful.')
    else
      flash.now[:alert] = "Login failed."
      render :action => "new" 
    end
  end

  def destroy
    logout
    redirect_to root_url, :notice => "Ausgeloggt!"
  end
end
