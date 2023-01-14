Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #顧客用
  # URL /users/sign_in ...
  devise_for :users,skip:[:passwords], controllers:{
    registrations:"public/registrations",
    sessions:'public/sessions'
  }

  #ゲストユーザー
  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  #管理者用
  # URL /admin/sign_in ...
  devise_for :admin,skip:[:registrations, :passwords] ,controllers:{
    sessions:'admin/sessions'
  }



  scope module: :public do
    root to:"homes#top"
    get 'about' => 'homes#about'
    get "search" => "searches#search"
    resources :public_messages, only:[:index, :create, :destroy]

    get 'users/my_page/:id' => 'users#show', as: "my_page"
    get 'users/my_page/:id/index' => 'users#index', as: "my_page_index"
    get 'users/information/edit' => 'users#edit'
    patch 'users/information' => 'users#update'
    get 'users/unsubscribe' => 'users#unsubscribe', as: "users_unsubscribe"
    patch 'users/withdraw' => 'users#withdrawal'

  end


  namespace :public do
    resources :stories
    resources :favorites, only:[:create, :destroy, :show]
    resources :story_comments, only:[:create, :destroy]
  end


  scope module: :admin do
    get 'admin' => 'homes#top'
  end

  namespace :admin do
    resources :genres, only:[:index, :create, :update]
    resources :users, only:[:show, :index, :update]
    resources :comments, only:[:index, :create, :update]
  end


end
