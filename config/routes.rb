Rails.application.routes.draw do
  devise_for :users, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  devise_for :admins, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
  }

  root to: "public/location_reports#top"

  namespace :admin do
    resources :users, only: [:destroy, :index, :show, :edit, :update]
    resources :location_reports, only: [:index, :show, :update] do
      resources :comments, only: [:edit, :destroy]
    end
    get 'top' => 'location_reports#top'
    get 'location_report_search' => 'location_reports#search'
    get 'user_search' => 'users#search'
  end

  namespace :public do
    resources :users, only: [:index, :show, :edit, :update] do
      resource :relationships, only: [:create, :destroy]
      member do
        get :favorites
      end
      # on: :member routingにIDを含めることができる
    get :followings, on: :member
    get :followers, on: :member
    end

    resources :location_reports, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
      resources :comments, only: [:edit, :update, :create, :destroy]
      resource :favorites, only: [:create, :destroy]
      resources :experiences, only: [:index]
      resource :experiences, only: [:create, :destroy]
    end
    # 検索機能(検索結果表示用)
    get 'location_report_search' => 'location_reports#search'
    get 'user_search' => 'users#search'

    get 'top' => 'location_reports#top'

    # get '/users/:id/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
    patch '/users/:id/withdrawal' => 'users#withdrawal', as: 'withdrawal'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
