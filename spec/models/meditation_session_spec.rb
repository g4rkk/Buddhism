require 'rails_helper'

RSpec.describe MeditationSession, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:meditation_guide).optional }

  it "is not valid without a duration" do
    session = MeditationSession.new(duration_seconds: nil)
    expect(session).not_to be_valid
  end

  it "is valid with a positive duration" do
    user = User.create!(email: "test@example.com", password: "password")
    session = MeditationSession.new(duration_seconds: 300, user: user)
    expect(session).to be_valid
  end

  it "is not valid with a non-positive duration" do
    session = MeditationSession.new(duration_seconds: 0)
    expect(session).not_to be_valid
  end
end
