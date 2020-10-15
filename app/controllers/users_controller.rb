class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @nickname = current_user.nickname
  end

  def show
    user = User.find(params[:id])
    @articles =user.articles
  end

  def edit
  end

  def update
  end

end
