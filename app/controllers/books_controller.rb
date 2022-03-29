class BooksController < ApplicationController
  
  def index
    @books = Book.all
  end

  # 投稿データの作成
  def new
    @book = Book.new
  end

  # 投稿データの保存
  def create
    @book = Book.new(book_params) # ストロングパラメーター
    @book.save
    redirect_to '/books'
  end

  def edit
  end

  def destroy
  end

  # ストロングパラメーター
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
