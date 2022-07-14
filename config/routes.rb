Rails.application.routes.draw do
  devise_for :users, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  devise_for :admins, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
  }

  root to: "public/location_reports#index"

  namespace :admin do
    resources :users, only: [:index, :show, :edit]
    resources :location_reports, only: [:index, :show]
    get 'top' => 'location_reports#top'
  end

  namespace :public do
    resources :users, only: [:index, :show, :edit, :update] do
      resource :relationships, only: [:create, :destroy]
      # on: :member routingにIDを含めることができる
    get :followings, on: :member
    get :followers, on: :member
    end

    resources :location_reports, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
      resources :comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
      resources :experiences, only: [:index]
      resource :experiences, only: [:create, :destroy]
    end

    get 'top' => 'location_reports#top'
    # 退会用
    get '/users/:id/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
    patch '/users/:id/withdrawal' => 'users#withdrawal', as: 'withdrawal'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
