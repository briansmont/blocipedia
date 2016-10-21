class Charge < ActiveRecord::Base
  belongs_to :user
  
  after_create :upgrade_user_role
  
  def upgrade_user_role
    current_user.role == "premium_member"
  end
  
end
