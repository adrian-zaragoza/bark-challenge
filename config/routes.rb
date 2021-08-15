Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  resources :dogs, except: [:show, :index]
  
  resources :dogs, only: [:show, :index] do
    resources :likes, only: [:create, :destroy]
  end
  
  root to: "dogs#index"
end
