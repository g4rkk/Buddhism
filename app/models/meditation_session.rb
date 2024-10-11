class MeditationSession < ApplicationRecord
  belongs_to :user
  belongs_to :meditation_guide
end