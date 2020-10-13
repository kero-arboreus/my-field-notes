Rails.application.routes.draw do
  devise_for :users
  root to: 'articles#index'
  resources :articles
  get 'article/hashtag/:name', to: 'article#hashtag'
end
