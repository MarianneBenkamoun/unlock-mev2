Rails.application.routes.draw do

ActiveAdmin.routes(self)
devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks", registrations: "users/registrations", sessions: "users/sessions"} do
end
devise_scope :user do
  get '/users/sign_out' => 'devise/sessions#destroy'
end
resource :profile, :only => :show, :as => :current_profile
  resource :profile, only: [ :edit, :destroy, :update ]


get 'pages/landing_page'

root to: 'pages#landing_page'#
resources :services
resources :courses do
    resources :payments, only: [:new, :create,:index,:show]
end
get 'pages/home'
get 'pages/course'


end
