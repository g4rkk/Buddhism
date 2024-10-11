class MeditationGuide < ApplicationRecord
  has_one_attached :audio
  belongs_to :user
  has_many :meditation_sessions
end