Rails.application.routes.draw do

  root to: 'photos#index'

  resources :photos do
        post 'add_tag'
        post 'delete_tag'
        put 'upvote'
        put 'downvote'
    resources :comments
  end
    resources :tags
    get '/my_photos', to: 'photos#my_index'
    get '/sign_in', to: 'users#sign_in'
    post '/sign_in', to: 'users#sign_in!'
    get '/sign_up', to: 'users#sign_up'
    post '/sign_up', to: 'users#sign_up!'
    get '/sign_out', to: 'users#sign_out!'


end
