class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable
         
  after_create :send_user_emails
  
  
  before_save { self.email = email.downcase if email.present? }
  
  
  private
  def send_user_emails
    UserMailer.new_user(self).deliver_now
  end
end
