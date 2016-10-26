class UsersController < ApplicationController
  
  before_action :authorized_to_see_users
  
  
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

  def show
  end
  
  private
    def authorized_to_see_users
      unless current_user.admin?
        flash[:alert] = "You must be an admin to do that!"
        redirect_to root_path
      end
    end
end
