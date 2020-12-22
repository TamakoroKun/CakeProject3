Rails.application.routes.draw do

  root :to => "homes#top"
  get "home/about" => "homes#about"
  
  namespace :admin do
    get 'customers/index'
    get 'customers/edit'
    get 'customers/show'
  end

  devise_for :customers, controllers: {
    registrations: "customers/registrations",
  }
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
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
    get "customers/unsubscribe" => "customers#unsubscribe"
    patch "customers/withdraw" => "customers#withdraw"
  end

  namespace :admin do
    resources :customer, :except => [:destroy, :new, :create]
  end

  scope module: :public do
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

end
