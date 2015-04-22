Rails.application.routes.draw do

  get 'welcome/index'

  get 'welcome/documentation'

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :appointments
    end
  end

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :appointment_imports
    end
  end

  resources :appointment_imports do
    collection { post :import }
  end

  resources :appointments do
   collection do
     post 'search', to: 'appointments#search'
   end
  end

  resources :appointment_imports do
    collection do
      post 'search', to: 'appointment_imports#search'
    end
  end

  root 'welcome#index'

end
