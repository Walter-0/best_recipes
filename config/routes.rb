Rails.application.routes.draw do

  root to: 'photos#index'

  resources :photos do
        post 'add_tag'
        post 'delete_tag'
    resources :comments
  end

    resources :tags

end
