Rails.application.routes.draw do
  apipie
  get 'api/v1/books/search', to: 'api/v1/books#search'
	namespace :api do
		namespace :v1 do
			resources :books
		end
	end
end
