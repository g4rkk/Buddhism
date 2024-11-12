# app/models/buddhist_site.rb
class BuddhistSite < ApplicationRecord
  # geocoded_by :address
  # after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }
  has_many :tags
  has_many :tagged_users, through: :tags, source: :user
  has_many :conversations, dependent: :destroy
end
