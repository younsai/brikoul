class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bids, dependent: :destroy
  has_many :missions, dependent: :destroy
  has_many :missions, through: :bids, dependent: :destroy
  # validates :email, :first_name, :last_name, :username, :phone_number, :cnie, :resume, presence: true
  # validates :username, :cnie, uniqueness: true
end
