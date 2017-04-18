Rails.application.routes.draw do
  apipie
 	devise_for :users
  get 'api/v1/books/search', to: 'api/v1/books#search'
 
	namespace :api do
		namespace :v1 do
			resources :books
			resources :readmes
			resources :profiles
			mount_devise_token_auth_for 'User', at: 'auth'
		end
	end
end
