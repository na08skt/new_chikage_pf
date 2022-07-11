Rails.application.routes.draw do
  namespace :public do
    get 'location_reports/new'
    get 'location_reports/index'
    get 'location_reports/show'
    get 'location_reports/edit'
  end
  namespace :admin do
    get 'location_reports/index'
    get 'location_reports/show'
    get 'location_reports/edit'
  end
  namespace :public do
    get 'comments/index'
    get 'comments/show'
    get 'comments/edit'
  end
  namespace :admin do
    get 'comments/index'
    get 'comments/show'
    get 'comments/edit'
  end
  devise_for :users, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  devise_for :admins, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
  }


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
