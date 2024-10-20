require 'rails_helper'

RSpec.describe Book, type: :model do
  it { should belong_to(:user) }
  it { should have_many(:bookmarks).dependent(:destroy) }
  it { should have_many(:bookmarked_by_users).through(:bookmarks).source(:user) }

  it "is valid with valid attributes" do
    user = User.create!(email: "admin@example.com", password: "password", admin: true)
    book = Book.new(title: "Sample Book", sect: "Sect", number: 1, user: user, file: fixture_file_upload(Rails.root.join('spec/fixtures/files/sample.pdf'), 'application/pdf'))
    expect(book).to be_valid
  end

  it "is not valid without a title" do
    book = Book.new(title: nil)
    expect(book).not_to be_valid
  end
end
