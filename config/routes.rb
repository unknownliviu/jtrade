Jtrade::Application.routes.draw do

  resources :items
  devise_for :users
  resources :users, only:[:show,:edit,:update] 
  root to: 'static_pages#home'

  match '/my_items' => 'items#my_index'
  match '/profile'  => 'users#show'
  match '/about'    => 'static_pages#about'
  match '/contact'  => 'static_pages#contact' 
end
