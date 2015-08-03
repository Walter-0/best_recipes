Rails.application.routes.draw do

  root to: 'photos#index'

  resources :photos do
    resources :comments
  end

  resources :tags

end
