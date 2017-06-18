Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :coin_checks 
  root 'application#home'
  #for routes customize 
  get 'coin_check/home', to: 'coin_checks#home'
end
