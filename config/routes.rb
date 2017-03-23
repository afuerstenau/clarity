Rails.application.routes.draw do
  resources :monitorings
  root 'services#index', as: 'services_index'

  resources :connections
  resources :components
  resources :services
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
