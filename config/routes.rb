Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   root to: 'cds#index'
  get '/thanks', to: 'thanks#thanks'

  # devise_for :users

  resources :cds, only: [:index, :show]
  resources :users, only: [:show, :edit, :update, :destroy]
  resources :carts, only: [:index, :create, :update, :destroy]
  resources :receipts, only: [:new, :create]
  resources :othersaddresses, only: [:new, :create, :update]
  resources :purchases, only: [:index]



  namespace :admins do
  		root to: 'admins#index'
  		resources :purchases, only: [:index]
		resources :receipts, only: [:update, :destroy]
		resources :users, only: [:index,:show, :edit, :update, :destroy]
		resources :artists, only: [:new, :index, :create, :destroy, :update, :edit]
		resources :cds do
		  resource :songs,only: [:create, :edit, :update, :destroy]
    end
	end
end
