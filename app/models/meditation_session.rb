class MeditationSession < ApplicationRecord
  belongs_to :user
  belongs_to :meditation_guide, optional: true  # 将此关系设置为可选

  validates :duration_seconds, presence: true, numericality: { greater_than: 0 }
end
