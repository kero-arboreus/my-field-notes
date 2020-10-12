class ArticlesController < ApplicationController
 before_action :authenticate_user!, only: [:new, :edit, :destroy]
 before_action :set_article, only:[:show, :edit, :update, :destroy] 
  def index
    @articles = Article.includes(:user).order('created_at DESC')
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.valid?
      @article.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    @article.update(article_params)
  end

  def destroy
    @article.destroy
  end

  private

  def article_params
    params.require(:article).permit(:image, :title, :date, :time_zone_id, :prefecture_id, :category_id, :text, :address, :latitude, :longitude, :parking, :crowd, :toilet).merge(user_id: current_user.id)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
