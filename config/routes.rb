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
    
    get '/customer_datas/:id/orders' => 'orders#index', as: "customer_data_orders" # 会員詳細 => 注文履歴の表示データを変える用
    get '/yesterday/orders' => 'orders#index', as: "yesterday_orders" # TOP,本日製作分の注文数 => 注文履歴の表示データ用
    get '/today/orders' => 'orders#index', as: "today_orders" # TOP,本日受注した注文数 => 注文履歴の表示データ用
    patch '/orders/:id/order_status' => 'orders#order_status_update', as: "order_status" # 注文ステータスupdate
    patch '/orders/:id/item_status' => 'orders#item_status_update', as: "item_status" # 製作ステータスupdate
    
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
  resources :items

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
