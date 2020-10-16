class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_article, only: [:show, :edit, :update, :destroy]

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
    @comment = Comment.new
    @comments = @article.comments.includes(:user)
  end

  def edit
  end

  def update
    @article.update(article_params)

    if @article.valid?
      redirect_to article_path
    else
      render 'edit'
    end
  end

  def destroy
    if @article.destroy
      redirect_to root_path
    else
      render 'show'
    end
  end

  def hashtag
    @hashtag = Hashtag.find_by(hashname: params[:name])
    @article = @hashtag.articles.page(params[:page]).order('updated_at DESC')
  end

  def search
    @results = Article.search(params[:keyword])
  end

  private

  def article_params
    params.require(:article).permit(:title, :date, :time_zone_id, :prefecture_id, :category_id, :text, :address, :latitude, :longitude, :parking, :crowd, :toilet, :hashbody, images: [], hashtag_ids: []).merge(user_id: current_user.id)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
