Nomster::Application.routes.draw do
  devise_for :users
  resources :places do
    resources :comments, :only => :create
  end
   root 'places#index'
end
