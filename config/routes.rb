Rails.application.routes.draw do
  devise_for :users
<<<<<<< HEAD

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :pets do
    resources :bookings, only: %i[new create]
=======
  root to: 'pages#home'
  resources :pets, only: [:index, :show, :new, :create] do
    resources :bookings, only: :create
  end
  resources :bookings, only: [:index, :update]
  namespace :owner do
    resources :bookings, only: :index
>>>>>>> 005412a2fbfcf65645b5a0c5bcf9a42929271964
  end
end
