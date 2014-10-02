Rails.application.routes.draw do
  root "galleries#index"

  resources :users, only: [:new, :create]

  resources :galleries do
    resources :images, only: [:show, :new, :create, :edit, :update]
  end
end

#  get "/galleries" => "galleries#index"
#  get "/galleries/new" => "galleries#new"
#  post "/galleries" => "galleries#create"
#  get "/galleries/:id" => "galleries#show"
#  get "/galleries/:id/edit" => "galleries#edit"
#  patch "/galleries/:id" => "galleries#update"
#  delete "/galleries/:id" => "galleries#destroy"
