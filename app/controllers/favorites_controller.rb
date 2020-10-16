class FavoritesController < ApplicationController
  before_action :set_article, only: [:create, :destroy]

  def index
    @favorites = Favorite.where(user_id: current_user.id)
  end

  def create
    @favorite = Favorite.new(user_id: current_user.id, article_id: @article.id)
    @favorite.save
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, article_id: @article.id)
    @favorite.destroy
  end

  private
  def set_article
    @article = Article.find(params[:article_id])
  end
end