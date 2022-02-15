Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # users can leave a review about a cosmetic and display them on cosmetic's page
  resources :cosmetics, except: [ :destroy ] do
    # The member scopes ensure that the id of the favourite is passed into the action,
    # while the method post ensures that the action will be sent securely to the db and not replicated on page refresh.
    # The generated route will look like this: cosmetics/:id/toggle_favorite
    member do
      post 'toggle_favorite', to: "cosmetics#toggle_favorite"
    end

    resources :reviews, only: [ :new, :create ]
  end

  get 'cosmetics/custom_path?product_id;other', to: 'cosmetics#compare', as: :compare
  get 'cosmetics/search?photo', to: 'cosmetics#search', as: :scan
  # get 'cosmetics/search?keyword', to: 'cosmetics#search', as: :search
  # later on displaying ingredients info
  # resources :ingredients, only: [ :show ] ?? how to grab ingredients info ??
end
