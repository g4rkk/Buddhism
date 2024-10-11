class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :meditation_guides
         has_many :meditation_sessions
         has_many :bookmarks
         has_many :books, through: :bookmarks
end
