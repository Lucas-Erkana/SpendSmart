Rails.application.routes.draw do
  devise_for :users

  get '/splash', to: 'splashes#index'


  devise_scope :user do
    authenticated :user do
      root 'categories#index', as: :authenticated_root
    end

    unauthenticated do
      root 'splashes#index', as: :unauthenticated_root
    end
  end

  resources :users, only: %i[index show new] do
    resources :categories, only: %i[new create show index destroy]
    resources :entities, only: %i[new create index show destroy]
  end
end
