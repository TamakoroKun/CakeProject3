Rails.application.routes.draw do

  root :to => "homes#top"
  get "home/about" => "homes#about"
  
  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    registrations: "customers/registrations",
    passwords: "customers/passwords",
  }
  
  namespace :admin do
    root to: 'homes#top'
    get 'customers/index'
    resources :customers, :only => [:show, :edit, :update]  
    end
  
  devise_for :admins, controllers: {
    sessions: 'admin/sessions',
    registrations: "admin/registrations",
    passwords: "admin/passwords",
  }

  # namespace :public do
  #   get 'orders/done'
  #   post 'orders/confirm'
  #   resources :orders
  # end

  scope module: :public do
    get "customers/my_page" => "customers#show"
    get "customers/editer" => "customers#edit"
    get "customers/unsubscribe" => "customers#unsubscribe"
    patch "customers" => "customers#update"
    patch "customers/withdraw" => "customers#withdraw"
    resources :addresses,  :except => :new
    get 'orders/done'
    post 'orders/confirm'
    resources :orders
    
  end

  namespace :public do
  resources :cart_items
  resources :items
  end

namespace :admin do
   resources :items
  resources :orders
  resources :order_details
   
end

 namespace :admin do
  resources :genres
  end

end
