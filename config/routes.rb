Rails.application.routes.draw do
  devise_for :users
  root to: 'articles#index'
  resources :articles do
    resources :comments,only: :create
  get 'article/hashtag/:name', to: 'articles#hashtag'
end
