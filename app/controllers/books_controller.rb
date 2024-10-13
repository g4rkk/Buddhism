class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = current_user.books.build(book_params)
    
    if @book.save
      flash[:notice] = "書籍が正常にアップロードされました。"
      redirect_to books_path
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

  def bookmarks
    @bookmarks = current_user.bookmarks.includes(:book)
  end

  def my_books
    @books = current_user.books
  end

  private

  def book_params
    params.require(:book).permit(:title, :sect, :number, :file)
  end
end