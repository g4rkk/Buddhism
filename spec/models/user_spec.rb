require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:meditation_guides) }
  it { should have_many(:meditation_sessions) }
  it { should have_many(:bookmarks) }
  it { should have_many(:bookmarked_books).through(:bookmarks).source(:book) }

  it "is valid with valid attributes" do
    user = User.new(email: "test@example.com", password: "password")
    expect(user).to be_valid
  end

  it "is not valid without an email" do
    user = User.new(email: nil)
    expect(user).not_to be_valid
  end
end
