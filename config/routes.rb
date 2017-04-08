Rails.application.routes.draw do
  apipie
 
  get 'api/v1/books/search', to: 'api/v1/books#search'
  mount_devise_token_auth_for 'User', at: 'api/v1/auth'

	namespace :api do
		namespace :v1 do
			resources :books
		end
	end
end
