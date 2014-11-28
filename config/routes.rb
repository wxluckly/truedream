Rails.application.routes.draw do
  root 'videos#index'

  resource :biography
  resource :contact
  resources :photos
  resources :videos

end
