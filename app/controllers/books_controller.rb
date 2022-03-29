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
    redirect_to book_path(book.id)
  end

  def show
    @book = Book.find(params[:id])
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  # 編集したら保存
  def update
    # 変数bookにモデルから探しだしたid/レコードを当てる
    book = Book.find(params[:id])
    # updateメソッド(ストロングパラメーター)
    book.update(book_params)
    # Createと同じ
    redirect_to book_path(book.id)
  end  

  def destroy
  end

  # ストロングパラメーター
  private
  
  def book_params
    params.require(:book).permit(:title, :body, :image)
  end
end
