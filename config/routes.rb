Rails.application.routes.draw do

  root :to => "homes#top"
  get "home/about" => "homes#about"

  namespace :admin do
    get 'customers/index'
    get 'customers/edit'
    get 'customers/show'
  end


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
    sessions: 'admin/sessions'
  }


  namespace :public do
    get 'customers/show'
    get 'customers/edit'
    get 'customers/unsubscribe'
    patch "customers" => "customers#update"
    get 'orders/done'
    resources :orders
  end


  scope module: :public do
    get "customers/my_page" => "customers#show"
    get "customers/edit" => "customers#edit"
    # get "customers/editer" => "customers#edit"
    get "customers/unsubscribe" => "customers#unsubscribe"
    resources :customers, :only => [:edit, :update]
    # patch "customers" => "customers#update"
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

scope module: :public do
  resources :cart_items
   delete 'cart_item_destroy_all', to:'cart_items#destroy_all'
 end
 
namespace :admin do
  resources :cart_items
    delete 'cart_item_destroy_all', to:'cart_items#destroy_all'
  end


    resources :order_items

end
