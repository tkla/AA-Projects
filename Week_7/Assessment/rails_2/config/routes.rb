Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :session, only: [:new, :create, :destroy]

  resources :users do 
    resources :goals, only: [:index, :create]
  end

  resources :goals, except: [:index, :create] 
end
