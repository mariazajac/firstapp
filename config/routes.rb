Rails.application.routes.draw do
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
