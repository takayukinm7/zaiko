Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to:'parts#index'
  resources :parts do
    collection do
      get 'search'
    end
    resources :part_stocks, only: :index
  end
  resources :products do
    collection do
      get 'search'
    end
    resources :part_lists, only: :create
  end
end
