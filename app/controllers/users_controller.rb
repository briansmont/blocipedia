class UsersController < ApplicationController
  def index
    @users = User.all
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
