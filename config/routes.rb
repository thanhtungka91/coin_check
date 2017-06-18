Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :coin_checks 
  root 'coin_checks#home'
  #for routes customize 
  get 'coin_check/home', to: 'application#home'
  get 'coin_check/history', to: 'coin_checks#home'
end
