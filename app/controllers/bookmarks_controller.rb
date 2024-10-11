class BookmarksController < ApplicationController
  before_action :authenticate_user!

  def index
    @bookmarked_books = current_user.books
  end
end