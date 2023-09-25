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
  end

  namespace :admin do
    resources :genres, only: [:index, :create, :update, :destroy]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
    resources :foods, only: [:new, :create, :index, :show, :edit, :update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
