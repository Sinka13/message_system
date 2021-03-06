Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  authenticated :user do
   root 'users#index'
   resources :users
   post 'read_messages' => 'chats#read_messages'
   get 'update_notification' => 'users#update_notification'
   scope 'admin' do
     get '/' => 'admin#index', as: 'admin'
   end
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
