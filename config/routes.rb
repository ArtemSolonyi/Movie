Rails.application.routes.draw do
  devise_for :users
  resources :movies
  patch '/movies/:id/rating', to:'movies#set_movie_rating'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
