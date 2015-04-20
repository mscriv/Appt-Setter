Rails.application.routes.draw do

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

  root 'appointments#index'

end
