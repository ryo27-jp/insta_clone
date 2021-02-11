class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)
      # sorceryで使える様になるメソッド
      redirect_to login_path, success: 'ユーザー登録しました。'
    else
      flash.now[:danger] = '登録に失敗しました。'
      render :new
    end
  end

  def index
    @users = User.all.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :username, :avatar)
  end
end
