Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # users can leave a review about a cosmetic and display them on cosmetic's page
  resources :cosmetics, except: [ :destroy ] do
    resources :reviews, only: [ :new, :create ]
  end

  get 'cosmetic/custom_path?product_id;other', to: 'cosmetics#compare' as: :compare
  get 'cosmetic/search?photo', to: 'cosmetics#search' as: :scan
  # later on displaying ingredients info
  # resources :ingredients, only: [ :show ] ?? how to grab ingredients info ??
end
