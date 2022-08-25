Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:create, :index, :show, :edit, :update, :destroy]
  resources :books, only: [:create, :index, :show, :edit, :update, :destroy]

  get "/home/about" => "homes#about", as: "about"

end
