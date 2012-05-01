class MessagesController < ApplicationController
  def index
	if @messages = Message.create(params[:message])

	else
  		# error handling
	end
  end
end	
