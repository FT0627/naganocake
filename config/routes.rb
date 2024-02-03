Rails.application.routes.draw do
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

    namespace :admin do
      root to: 'homes#top'
      get 'home/about', to: 'homes#about', as: :about
      resources :items, only: [:index, :new, :create, :update, :edit, :show]
      resources :genres, only: [:index, :create, :edit, :update]
      resources :customers, only: [:index, :show, :edit, :update]
    end

    scope module: :public do
      root to: 'homes#top'
      get 'home/about', to: 'homes#about', as: :about
      get 'customers/my_page', to: 'customers#show', as: :my_page
      get 'customers/information/edit',to: 'customers#edit', as: :edit
      patch 'customers/information', to: 'customers#update'
      get 'customers/confirm_withdraw', to: 'customers#confirm_withdraw', as: :confirm_withdraw
      patch 'customer/withdraw', to: 'customers#withdraw'
      resources :customers, only: [:show, :edit, :update, :confirm_withdraw, :withdraw]
      resources :items, only: [:index, :show]
      resources :addresses, only: [:index, :create, :update, :destroy, :edit]
    end




# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
