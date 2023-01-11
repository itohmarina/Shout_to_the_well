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
  devise_for :admins,skip:[:registrations, :passwords] ,controllers:{
    registrations:"admin/registrations",
    sessions:'admin/sessions'
  }

  def after_sign_out_path_for(resource)
    about_path
  end

  root to:"homes#top"
  get 'about' => 'homes#about'
  
  namespace :public do
    resources :stories
  end
  
  scope module: :public do

    get 'users/my_page' => 'users#show'
    get 'users/information/edit' => 'users#edit'
    patch 'users/information' => 'users#update'
    get 'users/unsubscribe' => 'users#unsubscribe'
    patch 'users/withdraw' => 'users#withdrawal'
    
  end 


end
