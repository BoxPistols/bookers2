class BooksController < ApplicationController

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

  # 投稿データの作成
  def new
    @book = Book.new
  end

  # 投稿データの保存
  def create
    @book = Book.new(book_params) # ストロングパラメーター
    @user = current_user
    @book.user_id = current_user.id

    # アソシエーションを設定
    if @book.save
      flash[:notice] = "「#{@book.title}」を投稿しました"
      redirect_to book_path(@book.id)
    else
      @user = current_user
      @books = Book.all
      render :index
      # redirect_to books_path
      # redirect_to user_path(@user.id)
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  # 編集したら保存
  def update
    # 変数bookにモデルから探しだしたid/レコードを当てる
    book = Book.find(params[:id])

    if book.update(book_params)
      redirect_to book_path(book.id), flash: { notice: "successfully 「#{book.title}」を編集しました" }
    else
      redirect_to books_path
    end
  end

  # 削除
  def destroy
    book = Book.find(params[:id]) # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    # 投稿一覧画面へリダイレクト
    redirect_to books_path, flash: { notice: "successfully 「#{book.title}」が削除されました" }
  end

  # ストロングパラメーター
  private
    def book_params
      params.require(:book).permit(:title, :body)
    end
end
