Rails.application.routes.draw do
  devise_for :users
  resources :lists do
    resources :tasks
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#index'
end
