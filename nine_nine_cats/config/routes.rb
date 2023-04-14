Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :cats, only: [:index, :create, :show, :update, :new]

  # Defines the root path route ("/")
  # root "articles#index"

  # get '/cats', to: 'cats#index'
  root "cats#index"

end
