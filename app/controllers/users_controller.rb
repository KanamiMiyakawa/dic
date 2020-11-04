class UsersController < ApplicationController
  before_action :authenticate_user, only: [:show, :edit, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to blogs_path, notice: "アカウントを作成しました"
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if@user.update(user_params)
      redirect_to user_path(current_user.id), notice: "プロフィール更新しました!"
    else
      redirect_to edit_user_path(current_user.id), notice: "プロフィールに失敗"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to blogs_path
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
