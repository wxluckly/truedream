Rails.application.routes.draw do
  root 'video#index'

  resource :biography
  resources :photos
  resources :videos

end
