class Book < ApplicationRecord
  belongs_to :user
  mount_uploader :file, BookUploader

  has_many :bookmarks, dependent: :destroy
end