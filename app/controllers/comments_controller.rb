class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = Comment.new(params[:comment])
    if @comment.save
      redirect_to @comment, notice: 'Comment was successfully created.'
    else
      render action: "new" 
    end
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update_attributes(params[:comment])
      redirect_to @comment, notice: 'Comment was successfully updated.'
    else
      render action: "edit" 
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @message = @comment.message
    @comment.destroy
    redirect_to @message
  end
end
