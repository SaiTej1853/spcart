Rails.application.routes.draw do
get 'pages/home'
resources :tasks, except: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
end