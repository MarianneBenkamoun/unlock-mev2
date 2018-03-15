Rails.application.routes.draw do

ActiveAdmin.routes(self)
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks", registrations: "users/registrations", sessions: "users/sessions"}
root to: 'services#index'
resources :services
resources :subservices
get 'pages/home'

end
