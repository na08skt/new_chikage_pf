Rails.application.routes.draw do

  namespace :public do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
    get 'users/destroy'
  end
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
    resources :users, only: [:index, :show, :edit, :update]
    resources :location_reports, only: [:new, :index, :show]
    get 'top' => 'location_reports#top'
    # 退会用
    get '/users/:id/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
    patch '/users/:id/withdrawal' => 'users#withdrawal', as: 'withdrawal'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
