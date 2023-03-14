Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get :dashboard, to: 'pages#dashboard', as: "dashboard"
  resources :activities, only: %i[index show new create edit update destroy]
  resources :trips, only: %i[index new create show edit update] do
    collection do
      get :filter_activities
    end
  end
  resources :trip_activities, only: [:update]
end

