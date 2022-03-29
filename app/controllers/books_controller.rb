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
    # アソシエーションを設定
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id)
    else
      render :new
    end
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

  # 削除
  def destroy
    book = Book.find(params[:id]) # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to books_path  # 投稿一覧画面へリダイレクト
   end

  # ストロングパラメーター
  private
  
  def book_params
    params.require(:book).permit(:title, :body, :image)
  end
end
