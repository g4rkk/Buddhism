class User < ApplicationRecord
  # Devise 模块
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 默认用户不是管理员
  attribute :admin, :boolean, default: false

  # 冥想指南和会话关联
  has_many :meditation_guides
  has_many :meditation_sessions

  # 书籍的关联
  has_many :books, dependent: :destroy

  # 书签和书籍的关联
  has_many :bookmarks
  has_many :bookmarked_books, through: :bookmarks, source: :book
end
