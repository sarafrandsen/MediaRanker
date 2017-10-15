Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'works#main'

  resources :users, only: [:index, :new, :create, :show]
  resources :votes, only: [:index, :new, :create]
  resources :works
end
