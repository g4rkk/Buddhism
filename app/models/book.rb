class Book < ApplicationRecord
  has_many :bookmarks
  has_many :users, through: :bookmarks

  validates :title, presence: true
  validates :number, presence: true, uniqueness: true

  mount_uploader :file, BookFileUploader
end