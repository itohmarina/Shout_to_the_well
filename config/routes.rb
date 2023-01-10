Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #顧客用
  devise_for :users,skip:[:passwords], controllers:{
    registrations:"public/registrations",
    sessions:'public/sessions'
  }
  #管理者用
  devise_for :admins,skip:[:registrations, :passwords] ,controllers:{
    registrations:"admin/registrations",
    sessions:'admin/sessions'
  }


  root to:"homes#top"

end
