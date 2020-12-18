Rails.application.routes.draw do

  root :to => "homes#top"
  get "home/about" => "homes#about"

  devise_for :customers
 
  namespace :public do
    get 'addresses/index'
    get 'addresses/edit'
    get 'customers/show'
    get 'customers/edit'
    get 'customers/unsubscribe'
  end

  scope module: :public do
    get "customers/my_page" => "customers#show"
    get "customers/edit" => "customers#edit"
    patch "customers" => "customers#update"
    get "customers/unsubscribe" => "customers#unsubscribe"
    patch "customers/withdraw" => "customers#withdraw"
  end
  
  namespace :admin do
    resources :customer, :except => [:destroy, :new, :create]
  end
  
  scope module: :public do
    resources :addresses,  :except => :new
  end
  
end
