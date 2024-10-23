class User < ApplicationRecord
  # Devise 模块
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

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

  # 从 OmniAuth 返回的数据中查找或创建用户
  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    # 如果用户不存在，则创建新用户
    unless user
      user = User.create(
        username: data['name'],
        email: data['email'],
        password: Devise.friendly_token[0, 20]
      )
    end
    user
  end
end
