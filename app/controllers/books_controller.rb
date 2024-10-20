class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_admin, only: [:new, :create]

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
  
    respond_to do |format|
      format.html { redirect_to books_path }
      format.json { render json: { status: 'success' } }
    end
  end

  def bookmarks
    @books = current_user.bookmarked_books
  end  

  def my_books
    @books = current_user.books
  end

  private

  def check_admin
    unless current_user.admin?
      flash[:alert] = "書籍をアップロードする権限がありません。"
      redirect_to books_path
    end
  end

  def book_params
    params.require(:book).permit(:title, :sect, :number, :file)
  end
end
