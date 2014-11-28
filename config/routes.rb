Rails.application.routes.draw do
  root 'videos#index'

  resource :biography
  resources :photos
  resources :videos

end
