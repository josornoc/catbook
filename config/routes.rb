Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  # resources :cats, only: [:index, :show, :edit, :update, :new]
  root 'cats#index'
	# root 'registrations#new'
  get '/register' => 'registration#new'
  post '/register' => 'registration#create'
  post '/login' => 'login#create'
  delete '/logout' => 'login#destroy'
  resources :cats  
end
