class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @books = Book.all.order(:title)
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book, notice: '書籍が正常に作成されました。'
    else
      render :new
    end
  end

  def toggle_bookmark
    @book = Book.find(params[:id])
    if current_user.bookmarks.exists?(book: @book)
      current_user.bookmarks.find_by(book: @book).destroy
      flash[:notice] = 'ブックマークを削除しました。'
    else
      current_user.bookmarks.create(book: @book)
      flash[:notice] = 'ブックマークを追加しました。'
    end
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :sect, :file, :number)
  end
end