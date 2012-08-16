class MessagesController < ApplicationController
  before_filter :get_message, :only => [:show, :edit, :destroy, :update]
  before_filter :new_message, :only => [:index, :new]
  before_filter :check_auth
  
  def index
    @tags = Tag.all
    @messages = Message.paginate(:per_page => 25, :page => params[:page]).includes(:comments, :user)
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

  def check_auth
    deny_access unless signed_in?
  end
end
