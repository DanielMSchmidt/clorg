class MessagesController < ApplicationController
  
  def index
    @messages = Message.all
  end

  def show
    @message = Message.find(params[:id])
    @comments = @message.comments
  end

  def new
    @message = Message.new
  end

  def edit
    @message = Message.find(params[:id])
  end

  def create
    @message = Message.new(params[:message])
    @message.user_id = current_user.id
    if @message.save
      redirect_to @message, notice: 'Message was successfully created.'
    else
      render action: "new" 
    end
  end

  def update
    @message = Message.find(params[:id])
    if @message.update_attributes(params[:message])
      redirect_to @message, notice: 'Message was successfully updated.'
    else
      render action: "edit" 
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to messages_url
  end
end
