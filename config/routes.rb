Rails.application.routes.draw do
  root 'bios#index'
  devise_for :users
  resources :bios

  resources :posts do 
    resources :comments
  end



end


