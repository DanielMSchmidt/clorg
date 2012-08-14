class TagsController < ApplicationController
  before_filter :check_auth, except: :show
  # GET /tags
  def index
    @tags = Tag.all
  end

  # GET /tags/1
  # GET /tags/1.js
  def show
    @tag = Tag.find(params[:id])
    @messages = @tag.messages unless @tag.nil?
    respond_to do |format|
      format.html # show.html.erb
      format.js #show.js.erb
    end
  end

  # GET /tags/new
  def new
    @tag = Tag.new
  end

  # GET /tags/1/edit
  def edit
    @tag = Tag.find(params[:id])
  end

  # POST /tags
  def create
    @tag = Tag.new(params[:tag])

    if @tag.save
      redirect_to @tag, notice: 'Tag was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /tags/1
  def update
    @tag = Tag.find(params[:id])
    if @tag.update_attributes(params[:tag])
      redirect_to @tag, notice: 'Tag was successfully updated.'
    else
      format.html { render action: "edit" }
    end
  end

  # DELETE /tags/1
  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to tags_url
  end

  def check_auth
    deny_access unless signed_in?
    redirect_to root_path, notice: "You have to be an admin to do this" unless current_user.admin?
  end
end
