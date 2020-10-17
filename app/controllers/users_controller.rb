class UsersController < ApplicationController
  before_action :authenticate_user!, except: :show

  def index
    @nickname = current_user.nickname
  end

  def show
    @user = User.find(params[:id])
    @articles = @user.articles
  end

  def edit
  end

  def update
    current_user.update(user_params)

    if current_user.valid?
      sign_in(current_user, bypass: true)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :nickname, :email)
  end
end
