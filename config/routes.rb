Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"

  # get 'post_images/new'
  # get 'post_images/index'
  # get 'post_images/show'
  resources :post_images, only: [:new, :index, :show]

  get 'homes/about', as: 'about'
end
