class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @nickname = current_user.nickname
  end

  def show
  end

  def edit
  end

  def update
  end

end
