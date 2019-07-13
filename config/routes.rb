Rails.application.routes.draw do
  # For details on the DSL available within this file,
  # see http://guides.rubyonrails.org/routing.html

  # new versions are to be defined here since Rails cycles through all
  # the routes from top to bottom until method, `matches?`,
  # finds a match i.e resolves to true

  # namespace the controllers without affecting the URI
  # set v1 as the default vesion
  scope module: :v1, constraints: ApiVersion.new('v1', true) do
    resources :restaurants do
      resources :items
    end
  end

  post 'auth/login', to: 'authentications#authenticate'
  post 'signup', to: 'users#create'
end
