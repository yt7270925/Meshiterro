Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get 'homes/about', as: 'about'

  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resource :favorites, only: [:create, :destroy] #単数形(resouce)にすることで、/:idがURLに含まれなくなる
    resources :post_comments, only: [:create, :destroy] #コメントとイメージを連結,createアクションへのルーティング
  end

  resources :users, only: [:show, :edit, :update]

end
