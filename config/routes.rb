Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root to: "posts#index"
  resources :posts do
   member do
     get :confirm_destroy
   end 

   collection do 
    get :published 
  end
end
    root 'posts#index'
end
