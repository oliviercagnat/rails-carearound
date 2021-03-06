Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get 'cosmetics/search', to: 'cosmetics#search', as: :scan
  post 'cosmetics/search', to: 'cosmetics#create'

  get 'pages/user_profile' => 'pages#user_profile'

  # users can leave a review about a cosmetic and display them on cosmetic's page
  resources :cosmetics, except: [:destroy] do
    # The member scopes ensure that the id of the favourite is passed into the action,
    # while the method post ensures that the action will be sent securely to the db and not replicated on page refresh.
    # The generated route will look like this: cosmetics/:id/toggle_favorite
    member do
      post 'toggle_favorite', to: "cosmetics#toggle_favorite"
      get 'compare', to: 'cosmetics#compare'
      get 'confirm', to: 'cosmetics#confirm'
    end

    resources :reviews, only: %i[new create]
  end

  get 'pages/user_profile', to: 'pages#user_profile'
  # later on displaying ingredients info
  # resources :ingredients, only: [ :show ] ?? how to grab ingredients info ??
end
