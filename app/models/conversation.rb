# app/models/conversation.rb
class Conversation < ApplicationRecord
  belongs_to :user
  belongs_to :buddhist_site
  has_many :messages, dependent: :destroy

  validates :user_id, uniqueness: { scope: :buddhist_site_id }
end
