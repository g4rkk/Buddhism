require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  let(:admin) { User.create!(email: 'admin@example.com', password: 'password', admin: true) }
  let(:user) { User.create!(email: 'user@example.com', password: 'password', admin: false) }
  let(:file) { fixture_file_upload(Rails.root.join('spec/fixtures/files/sample.pdf'), 'application/pdf') }
  let(:unique_number) { SecureRandom.random_number(1000) }  # 生成唯一的 number
  let(:book_params) { { title: 'Sample Book', sect: 'Sect', number: unique_number, file: file } }

  describe "POST #create" do
    context "when admin is logged in" do
      before { sign_in admin }

      it "allows the admin to create a new book" do
        expect {
          post :create, params: { book: book_params }
        }.to change(Book, :count).by(1)
        expect(flash[:notice]).to eq("書籍が正常にアップロードされました。")
        expect(response).to redirect_to(books_path)
      end
    end
  end
end
