Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => 'v1/registrations' }
  namespace :v1, defaults: { format: :json } do
  	resource :scene, only: [:create, :destroy], controller: :scenes
  	get '/scene', to: 'scenes#index'
  	get '/meets', to: 'scenes#getUsers'
  	get '/user', to: 'users#getUser'
  	post '/location', to: 'users#updateLocation'
    resource :login, only: [:create], controller: :sessions
  end
end
