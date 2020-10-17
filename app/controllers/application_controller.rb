class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :search_article

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :prefecture_id])
  end

  def search_article
    @p = Article.ransack(params[:q])
    @category = Category.where.not(id: 1)
    @prefecture = Prefecture.where.not(id: 1)
    @results = @p.result
  end
end
