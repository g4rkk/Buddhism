class MeditationGuide < ApplicationRecord
  has_one_attached :audio
  has_many :meditation_sessions
end