Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  resources :movies
  root 'movies#index'
  patch '/movies/:id/rating', to:'movies#set_movie_rating'
end
