class UsersController < ApplicationController
  def index
    @users = User.all
    @user = current_user

    @book = Book.new
    @books = Book.all
  end

  # def new
  #   @user = User.new
  # end

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render "edit"
    else
      redirect_to user_path(current_user)
    end
  end

  # 編集したら保存
  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to user_path(@user.id), flash: { notice: "successfully 「#{@user.name}」を編集しました" }
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
