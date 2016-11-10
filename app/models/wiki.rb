class Wiki < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  
  belongs_to :user
  has_many :collaborators
  has_many :users, through: :collaborators
  
  scope :visible_to, -> (user) {user ? where(private: false) : 'Premium members have access only.' }
end
