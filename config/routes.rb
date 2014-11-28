Rails.application.routes.draw do
  devise_for :staffers
  root 'videos#index'

  resource :biography
  resource :contact
  resources :photos
  resources :videos

  namespace :admin do 
    root 'welcome#index'
    resource :biography
    resources :photos
    resources :videos
  end

end
