class User < ApplicationRecord

  has_many :events, through: :attendances
  has_many :authored_events, class_name: 'Event', foreign_key: :user_id

  has_many :attendances

  after_create :welcome_send
  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
