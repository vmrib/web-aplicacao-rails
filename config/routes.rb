Rails.application.routes.draw do
  get 'login/index'
  get 'home/index'
  resources :esportes_pessoas
  resources :esportes
  resources :documentos
  resources :pessoas
  resources :estados
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "login#index"
end
