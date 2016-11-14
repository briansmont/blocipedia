class Wiki < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  def should_generate_new_friendly_id?
    title_changed?
  end
  
  belongs_to :user
  has_many :collaborators
  has_many :users, through: :collaborators
  
  scope :visible_to, -> (user) {user ? where(private: false) : 'Premium members have access only.' }
end
