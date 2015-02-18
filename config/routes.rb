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

  #get '/api/v1/cats' => 'api#cats'

  namespace :api do
    namespace :v1 do
      # get '/api/v1/cats' => 'api#cats'
      resources :cats, only: [:index]
    end
  end

  resources :cats  
end
