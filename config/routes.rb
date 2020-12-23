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
  end

  namespace :public do
  resources :items
  end

namespace :admin do
   resources :items
end

 namespace :admin do
  resources :genres
  end

  resources :cart_items, only: [:index, :show, :create, :destroy, :update] do
      delete 'destroy_all', on: :member
      post 'create_order', on: :member
    end
    delete 'cart_item_destroy_all', to:'cart_items#destroy_all'
    post 'create_order', to:'cart_items#create_order'


    resources :order_items

end
