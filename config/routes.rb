Rails.application.routes.draw do
  apipie
 
  get 'api/v1/books/search', to: 'api/v1/books#search'
 
	namespace :api do
		namespace :v1 do
			resources :books
			mount_devise_token_auth_for 'user', at: 'auth'
		end
	end
end
