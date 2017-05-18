Rails.application.routes.draw do
  resources :poems, only: [:index]

  root 'poems#index'
end
