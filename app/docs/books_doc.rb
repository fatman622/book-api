module BooksDoc
	extend Apipie::DSL::Concern

	def_param_group :main_params do
    param :author, String, desc: 'The field note author book. '
    param :text, String, desc: 'The text book. '
    param :available, [true, false] , desc: 'Available book.'
    param :pages, Integer, desc: 'The count of pages. '
  end

  api :GET, '/books', 'All books '
  description <<-EOS
    == Get Action Books
    Is used for show books
      Is used for get all books
        curl localhost:5000/api/v1/books -X GET 
      Is used for get books by name and/or available with scope
        curl -v localhost:5000/api/v1/books -X GET -H "Accept: application/json" -H "Content-Type: application/json" -d '{"author": "Oleg", "available": true}'
      Is used for get books by all filelds with elasticsearch
        curl -v localhost:5000/api/v1/books/search -X GET -H "Accept: application/json" -H "Content-Type: application/json" -d '{"query": "Oleg"}'
      Is used for auth
        curl -v localhost:5000/api/v1/auth -X POST -H "Accept: application/json" -H "Content-Type: application/json" -d '{"email": "olegbaby@gmail.com", "password": "123456789", "password_confirmation": "123456789", "first_name": "John", "last_name": "Smith" }'
        curl -v localhost:5000/api/v1/auth/sign_in -X POST -H "Accept: application/json" -H "Content-Type: application/json" -d '{"email": "olegbaby@gmail.com", "password": "123456789"}'
        curl -v localhost:5000/api/v1/books -X GET -H 'Content-Type: application/json' -H 'access-token: lM_sZKwvk5yOSwkmsHC-BQ' -H 'client: lvLMUIVaNWrx9nTe1LmYIw' -H "uid: olegbaby@gmail.com"
    EOS
  param_group :main_params
  param :created_at, Date, desc: 'Created at'
  param :updated_at, Date, desc: 'Updated at'
  def index; end

  api :POST, '/books', 'Create Book'
  description <<-EOS
    == Create Book article
    Is used for creating book
      curl -v localhost:5000/api/v1/books -X POST -H "Accept: application/json" -H "Content-Type: application/json" -d '{"author": "Star Wars: A New Hope", "text": "asdasd", "available": "false", "pages": "23"}'
    EOS
  param_group :main_params
  def create; end  

  api :GET, '/books/:id', 'Show Book'
  description <<-EOS
    == Show single book
    Is used for show single book
      curl -v localhost:5000/api/v1/books/34
    EOS
  param :id, Integer, desc: 'Id book for show. '
  def show; end

  api :DELETE, '/books/:id', 'Delete Book'
	description <<-EOS
	  == Delete single book
	  Is used for delete single book
	    curl -v localhost:5000/api/v1/books/31 -X DELETE -H "Accept: application/json" -H "Content-Type: application/json"
	  EOS
	param :id, Integer, desc: 'Id book for delete. '
	def destroy; end
end