class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_save { self.role ||= :standard }

  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 254 }

  has_many :wikis


  after_create :send_application_email

  enum role: [:standard, :premium, :admin]
  private
  def send_application_email
    ApplicationMailer.new_user(self).deliver_now
  end
end
