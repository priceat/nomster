Nomster::Application.routes.draw do
  devise_for :users
  resources :places do
    resources :comments, :only => :create
  end
   root 'places#index'
  resources :places do
   resources :photos, :only => :create
 end
 resources :users, :only => :show
end
