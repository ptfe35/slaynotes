Rails.application.routes.draw do

  # 管理者用
  namespace :admin do
    devise_for :admins, controllers: {
      sessions: 'admin/admins/sessions',
      registrations: 'admin/admins/registrations',
      passwords: 'admin/admins/passwords'
    }
    root 'home#top'
  end

  # 一般会員用
  scope module: 'public' do
    devise_for :end_users, controllers: {
      sessions: 'public/end_users/sessions',
      registrations: 'public/end_users/registrations',
      passwords: 'public/end_users/passwords'
    }
    root 'home#top'
    get 'home/about' => 'home#about', as: 'about'
    post '/home/guest_sign_in', to: 'home#new_guest' # ゲストログイン

    resources :end_user_relationships, only: [:create, :destroy]
    resources :end_users do
      member do
        get :following, :followers
      end
    end

    resources :notes do
      put :sort
    end

    resources :pages do
      resources :page_comments, only: [:create, :destroy]
      resource :page_favorites, only: [:create, :destroy]
      put :sort
    end
    resources :page_images, only: [:create, :destroy]

    resource :network, only: [:show]
    get 'networks/search' => 'networks#search', as: 'search'

    resources :notifications, only: :index
    delete 'notifications' => 'notifications#destroy_all', as: 'destroy_all_notifications'
    resources :organizes, only: [:index, :show]

#  get 'customers/mypage' => 'customers#show', as: 'mypage'
#  get 'customers/information/edit' => 'customers#edit', as: 'edit_information'
#  patch 'customers/information' => 'customers#update', as: 'update_information'
#  put 'customers/information' => 'customers#update'
#  get 'customers/unsubscribe' => 'customers#unsubscribe', as: 'confirm_unsubscribe'
#  patch 'customers/withdraw' => 'customers#withdraw', as: 'withdraw_customer'
#  put 'customers/withdraw' => 'customers#withdraw'
#  delete 'cart_items/destroy_all' => 'cart_items#destroy_all', as: 'destroy_all_cart_items'
#  post 'orders/confirm' => 'orders#confirm'
#  get 'orders/confirm' => 'orders#error'
#  get 'orders/thanks' => 'orders#thanks', as: 'thanks'
#  resources :addresses, only: [:index, :create, :edit, :update, :destroy]
#  resources :items, only: [:index, :show] do
#    resources :cart_items, only: [:create, :update, :destroy]
#  end
#  resources :cart_items, only: [:index]
#  resources :orders, only: [:new, :index, :create, :show]
end

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
