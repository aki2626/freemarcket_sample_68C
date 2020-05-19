Rails.application.routes.draw do

  devise_for :users
  root 'items#index'
  resources :items do
    collection do
      get 'buy'
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
  resources :users, only: :show
end
