class MeditationSession < ApplicationRecord
  belongs_to :user
  belongs_to :meditation_guide

  validates :duration_seconds, presence: true, numericality: { greater_than: 0 }
end
