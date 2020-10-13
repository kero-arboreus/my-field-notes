Rails.application.routes.draw do
  devise_for :users
  root to: 'articles#index'
  resources :articles
  get 'article/hashtag/:name', to: 'articles#hashtag'
end
