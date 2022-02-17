Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # users can leave a review about a cosmetic and display them on cosmetic's page
  resources :cosmetics, except: [ :destroy ] do
    resources :reviews, only: [ :new, :create ]
  end
  get 'cosmetics/custom_path?product_id;other', to: 'cosmetics#compare', as: :compare
  get 'cosmetics/search?photo', to: 'cosmetics#search', as: :scan
  get 'pages/user_profile', to: 'pages#user_profile'
  # get 'cosmetics/search?keyword', to: 'cosmetics#search', as: :search
  # later on displaying ingredients info
  # resources :ingredients, only: [ :show ] ?? how to grab ingredients info ??
end
