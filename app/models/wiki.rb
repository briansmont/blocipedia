class Wiki < ActiveRecord::Base
  belongs_to :user
  
  scope :visible_to, -> (user) {user ? where(private: false) : 'Premium members have access only.' }
end
