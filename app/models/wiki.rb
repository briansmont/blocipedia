class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborators
  has_many :users, through: :collaborators
  
  scope :visible_to, -> (user) {user ? where(private: false) : 'Premium members have access only.' }
end
