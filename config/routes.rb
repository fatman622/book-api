Rails.application.routes.draw do
  apipie
  # get 'api/v1/books/', to: 'api/v1/books#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	namespace :api do
		namespace :v1 do
			resources :books
		end
	end
end
