class MeditationGuide < ApplicationRecord
  has_one_attached :audio
  has_many :meditation_sessions

  # 在保存之前自动生成 slug
  before_save :set_slug

  private

  # 如果 slug 为空，则根据 title 自动生成 slug
  def set_slug
    if slug.blank?
      self.slug = title.parameterize
    end
  end
end
