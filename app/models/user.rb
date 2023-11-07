class User < ApplicationRecord

  has_many :events, through: :attendances
  has_many :attendances

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :description, presence: true

  after_create :welcome_send
  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
