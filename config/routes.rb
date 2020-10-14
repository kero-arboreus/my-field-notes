Rails.application.routes.draw do
  get 'comments/new'
  devise_for :users
  root to: 'articles#index'
  resources :articles do
    resources :comments,only: :create
  end
  get 'article/hashtag/:name', to: 'articles#hashtag'
end
