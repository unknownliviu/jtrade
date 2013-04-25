class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :phone, :location
  # attr_accessible :title, :body

  VALID_PHONE_REGEX = /\d{7,15}/
  validates :name , presence: true, length: {maximum: 20, minimum: 3}
  validates :phone, length: { maximum: 15 }, format: { with: VALID_PHONE_REGEX }
  validates :location, length: { maximum: 100 }

end
