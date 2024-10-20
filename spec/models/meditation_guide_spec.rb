require 'rails_helper'

RSpec.describe MeditationGuide, type: :model do
  it { should have_many(:meditation_sessions) }

  it "generates a slug before save if none is provided" do
    guide = MeditationGuide.new(title: "Sample Guide")
    guide.save
    expect(guide.slug).to eq("sample-guide")
  end
end
