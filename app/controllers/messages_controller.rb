class MessagesController < ApplicationController
  before_filter :get_message, :only => [:show, :edit, :destroy, :update]
  before_filter :new_message, :only => [:index, :new]

  def index
    @tags = Tag.all
    @activeTag = params[:tag]
    if params[:tag]
      @messages = Message.tagged_with(@activeTag).page(params[:page]).per_page(10).includes(:comments, :user)
    else
      @messages = Message.page(params[:page]).per_page(10).includes(:comments, :user)
    end

    respond_to do |format|
      format.html # show.html.erb
      format.js #show.js.erb
    end
  end

  def show
    @comments = @message.comments
  end

  def new
  end

  def edit
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
    if @message.update_attributes(params[:message])
      redirect_to @message, notice: 'Message was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @message.destroy
    redirect_to messages_url
  end

  def new_message
    @message = Message.new
  end

  def get_message
    @message = Message.find(params[:id])
  end
end
