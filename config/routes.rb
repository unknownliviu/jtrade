Jtrade::Application.routes.draw do
  
  devise_for :users

  root to: 'static_pages#home'

  match 'profile'   => 'profiles#edit'
  match '/about'    => 'static_pages#about'
  match '/contact'  => 'static_pages#contact' 
end
