Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :restaurants do
    resources :items
  end

  post 'auth/login', to: 'authentications#authenticate'
  post 'signup', to: 'users#create'
end
