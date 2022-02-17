class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # validates :name, :avatar, :skin_type, :country, presence: true
  acts_as_favoritor
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  acts_as_favoritor
end
