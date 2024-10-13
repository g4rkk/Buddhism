class Book < ApplicationRecord
  belongs_to :user
  mount_uploader :file, BookUploader

  has_many :bookmarks, dependent: :destroy
  has_many :bookmarked_by_users, through: :bookmarks, source: :user
end