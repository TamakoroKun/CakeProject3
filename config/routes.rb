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
<<<<<<< HEAD


=======
>>>>>>> 038317bd90434d65c5f9e2ae3f234d7a8331c5ea
    get 'orders/done'
    resources :orders
  end

  scope module: :public do
    get "customers/my_page" => "customers#show"
    get "customers/edit" => "customers#edit"
<<<<<<< HEAD

=======
>>>>>>> 038317bd90434d65c5f9e2ae3f234d7a8331c5ea
    get "customers/unsubscribe" => "customers#unsubscribe"
    patch "customers/withdraw" => "customers#withdraw"
  end

  namespace :admin do
    resources :customer, :except => [:destroy, :new, :create]
  end

  scope module: :public do
    resources :addresses,  :except => :new
  end

<<<<<<< HEAD
  namespace :public do
  resources :items
  end

namespace :admin do
   resources :items
end

 namespace :admin do
  resources :genres
  end


=======
>>>>>>> 038317bd90434d65c5f9e2ae3f234d7a8331c5ea
end
