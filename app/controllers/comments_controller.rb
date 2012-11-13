class CommentsController < ApplicationController
  before_filter :get_message
  before_filter :get_comment, :only => [:show, :edit, :destroy, :update]
  before_filter :new_comment, :only => [:index, :new]

  def index
    @comments = @message.comments
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    @comment = Comment.new(params[:comment])
    @comment.user_id = current_user.id
    @comment.message_id = @message.id
    if @comment.save
      redirect_to @message, notice: 'Comment was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @comment.user_id = current_user.id
    if @comment.update_attributes(params[:comment])
      redirect_to [@message, @comment], notice: 'Comment was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @comment.destroy
    redirect_to @message
  end

  def get_message
    @message = Message.find(params[:message_id])
  end

  def get_comment
    @comment = @message.comments.find(params[:id])
  end

  def new_comment
    @comment = Comment.new
  end
end
