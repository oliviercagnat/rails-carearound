Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # users can leave a review about a cosmetic and display them on cosmetic's page
  resources :cosmetics, only: [ :index, :show ] do
    resources :reviews, only: [ :new, :create ]
  end
  # later on displaying ingredients info
  # resources :ingredients, only: [ :show ] ?? how to grab ingredients info ??
end
