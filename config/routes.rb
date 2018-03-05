Rails.application.routes.draw do
  resources :tasks, only: [:index, :show] do
    member do
      post 'not_maked'
      post 'maked'
    end
  end
  devise_for :users

  root 'tasks#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
