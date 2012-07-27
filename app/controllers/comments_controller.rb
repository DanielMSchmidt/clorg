class CommentsController < ApplicationController
  before_filter :get_message
  def index
    @comments = @message.comments
  end

  def show
    @comment = @message.comments.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def edit
    @comment = @message.comments.find(params[:id])
  end

  def create
    @comment = Comment.new(params[:comment])
    @comment.user_id = current_user
    @comment.message_id = @message.id
    if @comment.save
      redirect_to @message, notice: 'Comment was successfully created.'
    else
      render action: "new" 
    end
  end

  def update
    @comment = @message.comments.find(params[:id])

    if @comment.update_attributes(params[:comment])
      redirect_to [@message, @comment], notice: 'Comment was successfully updated.'
    else
      render action: "edit" 
    end
  end

  def destroy
    @comment = @message.comments.find(params[:id])
    @comment.destroy
    redirect_to @message
  end

  def get_message
    @message = Message.find(params[:message_id])
  end
end
