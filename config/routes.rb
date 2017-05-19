Rails.application.routes.draw do
  devise_for :admins, controllers: { registrations: "registrations" }, skip: [:sessions]
  as :admin do
    get 'sabrina', to: 'devise/sessions#new', as: :new_admin_session
    post 'sabrina', to: 'devise/sessions#create', as: :admin_session
    delete 'signout', to: 'devise/sessions#destroy', as: :destroy_admin_session
  end
  resources :poems, only: [:index]

  root 'poems#index'
end
