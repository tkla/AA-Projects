Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :session, only: [:create, :new, :destroy]
  resources :users do 
    resources :subs, except: [:index, :show]
  end
  resources :subs, only: [:index, :show, :destroy]
end
