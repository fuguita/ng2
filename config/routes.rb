Rails.application.routes.draw do

  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }

  scope module: :public do
    root to: "homes#top"
    resource :customers, only: [:show]
    get 'customers/information/edit' => "customers#edit", as: 'information_edit_customers'
    get 'customers/check' => "customers/check", as: 'check'
    patch 'customers/information' => "customers#update", as: 'information_customers'
    patch 'customers/withdraw' => "customers#withdraw", as: 'withdraw_customers'
    resources :foods, only: [:show, :index]
    delete 'cart_items/destroy_all' => "cart_items#destroy_all", as: 'cart_item_destroy_all'
    resources :cart_items, only: [:create, :index, :update, :destroy]
    resources :shippings, only: [:create, :index, :edit, :update, :destroy]
  end

  namespace :admin do
    resources :genres, only: [:index, :edit, :create, :update, :destroy]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
    resources :foods, only: [:new, :create, :index, :show, :edit, :update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
