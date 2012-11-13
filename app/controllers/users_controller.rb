class UsersController < ApplicationController
  skip_before_filter :require_login, :only => [:index, :new, :create, :activate]
  before_filter :admin_user, :only => :destroy

  def index
    @title = "All users"
    @users = User.paginate(:per_page => 25, :page => params[:page])
  end

  def show
    @user = User.find(params[:id])
    @title = @user.name
  end

  def new
    @title = "Sign up"
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Thanks for joining. Please activate your account now!"

      redirect_to root_path
    else
      @title = "Sign up"
      render 'new'
    end
  end

  def edit
    @title = "Edit user"
    @user = User.find(params[:id])
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      @title = "Edit user"
      render 'edit'
    end
  end

  def destroy

    toBeDeleted = User.find(params[:id])

    if toBeDeleted == current_user 
      if current_user.admin?
        flash[:notice] = "Don't delete yourself as admin."
      else
        flash[:success] = "You destroyed yourself."
        toBeDeleted.destroy  
        redirect_to root_path
      end
    else
      flash[:notice] = "You shouldn't delete others."
    end
    redirect_to(users_path)
  end

  def activate
    if (@user = User.load_from_activation_token(params[:id]))
      @user.activate!
      redirect_to(login_path, :notice => 'User was successfully activated.')
    else
      not_authenticated
    end
  end

  private

    def authenticate
      deny_access unless signed_in?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end

end
