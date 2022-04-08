class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  # 編集したら保存
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id), flash: { notice: "successfully 「#{@user.name}」を編集しました" }
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
