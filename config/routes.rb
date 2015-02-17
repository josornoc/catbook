Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  # resources :cats, only: [:index, :show, :edit, :update, :new]

  root 'cats#index'
  resources :cats
  
end
