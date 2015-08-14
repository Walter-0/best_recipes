Rails.application.routes.draw do

  root to: 'photos#index'

  # nice routes!
  resources :photos do
        post 'add_tag'
        post 'delete_tag'
        put 'upvote'
        put 'downvote'
    resources :comments
  end

  get '/my_photos', to: 'photos#my_index'
  resources :tags

  # these are indented one level too far... also, it's a nice idea to keep
  # related routes together (e.g. my_photos up near photos.)
  # also, a small suggestion is to align code like this to columns for readability
  get   '/sign_in',   to: 'users#sign_in'
  post  '/sign_in',   to: 'users#sign_in!'
  get   '/sign_up',   to: 'users#sign_up'
  post  '/sign_up',   to: 'users#sign_up!'
  get   '/sign_out',  to: 'users#sign_out!'
end
