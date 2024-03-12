Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  delete "/delete/:id" => "movies#destroy"
  put "/update/:id" => "movies#update"

  get "/about" => "movies#about"

  get "/add" => "movies#add"
  post "/add" => "movies#create"

  root "movies#index"

  

  # Defines the root path route ("/")
  # root "posts#index"
end