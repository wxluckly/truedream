Rails.application.routes.draw do
  devise_for :staffers, controllers: { sessions: 'admin/sessions', registrations: 'admin/admins' }
  root 'welcome#index'

  resource :biography
  resource :contact
  resources :photos
  resources :videos
  resources :news

  namespace :admin do 
    root 'welcome#index'
    resource :biography
    resources :photos
    resources :videos
    resources :news
  end

end
