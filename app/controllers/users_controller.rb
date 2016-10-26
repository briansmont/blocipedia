class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.name = params[:user][:name]
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    @user.password_confirmation = [:user][:password_confirmation]
    
    if @user.save
      flash[:notice] = "Welcome to Blocipedia!"
      redirect_to root_path
    else
      flash[:error] = "There was an error creating the account, try again"
      render :new
    end
  end
  
  def downgrade
    @user = User.find(params[:id])
    @user.role = "standard_member"
    
    if @user.save
      flash[:notice] = "you have successfully downgraded"
      redirect_to :back
    else
      flash[:error] = "There has been an error, try again"
      redirect_to :back
    end
  end


  def edit
  end

  def update
  end

  def show
  end
end
