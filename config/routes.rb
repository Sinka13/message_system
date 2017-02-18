Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  authenticated :user do
   root 'users#index'
   resources :users
 end

 unauthenticated :user do
   devise_scope :user do
     get "/" => "devise/sessions#new"
   end
 end

 resources :chats do
   resources :messages
 end
end
