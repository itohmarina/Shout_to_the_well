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

  end


  namespace :public do
    resources :users, only:[:show, :index, :edit, :update]
    get 'users/:id/story_index' => 'users#story_index'
    get '/unsubscribe' => 'users#unsubscribe'
    patch '/withdraw' => 'users#withdrawal'
    get 'users/:id/group_index' => 'users#group_index', as: "users_group_index"

    resources :users do
      resource :relationships, only:[:create, :destroy]
      get 'relationships/followings' => 'relationships#followings'
      get 'relationships/followers' => 'relationships#followers'
    end

    resources :stories do
      resources :story_comments, only:[:create, :destroy]
    end
    resources :favorites, only:[:create, :destroy, :show]

    resources :groups, only:[:show, :index, :new, :create, :update, :edit]
    get 'groups/close/:id' => 'groups#close'
    resources :groups do
      resource :group_users, only:[:new, :create, :destroy]
      patch 'group_users/accept' => 'group_users#accept'
      resources :group_messages, only:[:create, :destroy]
    end

    resource :suggestions, only:[:new, :create]
    get 'suggestions/confirm' => 'suggestions#confirm'
    get 'suggestions/thanks' => 'suggestions#thanks'

    resources :genres, only:[:show]

  end



  scope module: :admin do
    get 'admin' => 'homes#top'
  end

  namespace :admin do
    resources :genres, only:[:index, :create, :update]
    resources :users, only:[:show, :index, :update]
    resources :comments, only:[:index, :create, :update]
    resources :suggestions, only:[:index, :show]
    resources :stories, only:[:update, :index]
    resources :groups, only:[:update, :index]
  end


end
