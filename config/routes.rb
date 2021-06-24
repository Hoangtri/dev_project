Rails.application.routes.draw do
  # get 'pages/home'
  devise_for :users, controllers: { sessions: 'users/sessions' }

  resources :share_videos, path: 'share',  only: [:create] do
    collection do
      get :new
    end
  end

  root 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
