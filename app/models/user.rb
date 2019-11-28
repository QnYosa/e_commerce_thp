class User < ApplicationRecord
  has_many :carts
  has_many :orders, through: :carts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # plus de credit sendgrid
  # after_create :welcome_send
  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

end
