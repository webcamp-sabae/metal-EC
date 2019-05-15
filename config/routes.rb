Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'cds#index'

  get '/thanks', to: 'thanks#thanks'

  # devise_for :users

  resources :cds, only: [:index, :show]
  resources :users, only: [:show, :edit, :update, :destroy]
  resources :carts, only: [:index, :create, :update, :destroy]
  resources :recipts, only: [:new, :create]
  resources :othersaddresses, only: [:new, :create, :update]
  resources :purchases, only: [:index]


  namespace :admins do
  		root to: 'admin#index'
  		resources :purchases, only: [:index]
		resources :receipts, only: [:update, :destroy]
		resources :users, only: [:index,:show, :edit, :update]
		resources :artists, only: [:create, :destroy, :update, :edit]
		resources :cds do
			resources :songs,only: [:create, :edit, :update, :destroy]
		end
	end
end
