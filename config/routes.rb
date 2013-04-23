Jtrade::Application.routes.draw do
  
  root to: 'static_pages#home'

  match '/about'    => 'static_pages#about'
  match '/contact'  => 'static_pages#contact' 
end
