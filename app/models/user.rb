class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
<<<<<<< HEAD
=======

  after_create :send_application_email

  private
  def send_application_email
    ApplicationMailer.new_user(self).deliver_now
  end
>>>>>>> checkpoint-2
end
