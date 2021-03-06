Rails.application.routes.draw do
  devise_for :users

  # root_path
  root 'blogs#index'

  # devise
  devise_scope :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  # user <---> blog
  resources :users, only: [] do
    resources :blogs, only: [:new, :create, :destroy, :edit, :update]
  end
  # blog <---> articles
  resources :blogs, only: [:show] do
    resources :articles, only: [:new, :create, :show]
  end

  # other
  resources :blog,       only: [:update]
  resources :articles,   only: [:index, :edit, :update, :destroy, :show]
  resources :categories, only: [:new, :create, :show]

  # routing_error
  get  '*not_found' => 'application#routing_error'
  post '*not_found' => 'application#routing_error'

end
