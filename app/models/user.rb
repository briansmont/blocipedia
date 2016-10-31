class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  has_many :charges
  has_many :wikis
  has_many :collaborators
  has_many :wikis, through: :collaborators
  
  
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable
         
  after_create :send_user_emails
  
  
  before_save { self.email = email.downcase if email.present? }
  after_initialize { self.role ||= :standard_member }
  
  enum role: [:standard_member, :premium_member, :admin]
  
  private
  def send_user_emails
    UserMailer.new_user(self).deliver_now
  end
end
