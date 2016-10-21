class Charge < ActiveRecord::Base
  belongs_to :user
  
  after_create :upgrade_user_role
  
  
  
end
