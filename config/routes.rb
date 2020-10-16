Rails.application.routes.draw do
  get 'comments/new'
  devise_for :users
  root to: 'articles#index'
  resources :users, only: [:index, :show, :edit, :update]
  resources :articles do
    resources :comments,only: :create
    collection do
      get 'search'
    end
  end
  get 'article/hashtag/:name', to: 'articles#hashtag'
end
