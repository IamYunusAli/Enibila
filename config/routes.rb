Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  # Defines the root path route ("/")
  # root "articles#index"
  # root to: 'recipes#index'
  resources :users
  resources :recipes do
    resources :recipe_foods
  end
  resources :foods
  resources :public_recipes, only: [:index]
  resources :generate, only: [:index]
end
