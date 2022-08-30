class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bids
  has_many :missions
  has_many :missions, through: :bids
  # validates :email, :first_name, :last_name, :username, :phone_number, :cnie, :resume, presence: true
  # validates :username, :cnie, uniqueness: true
end
