module BooksDoc
	extend Apipie::DSL::Concern

	def_param_group :main_params do
    param :author, String, desc: 'The field note author book. ', :required => true 
    param :text, String, desc: 'The text book. ', :required => true 
    param :available, [true, false] , desc: 'Available book.'
    param :pages, Integer, desc: 'The count of pages. ', :required => true 
    param :genre, String, desc: 'The book genree ', :required => true 
    param :name, String, desc: 'The book name. ', :required => true 
    param :number, Integer, desc: 'Number. ', :required => true 
    param :book_content, File, desc: 'File attachment '
  end

  api :GET, '/books', 'All books '
  description <<-EOS
    == Get Action Books
    Is used for show books
      Is used for auth
        curl -v localhost:5000/api/v1/auth -X POST -H "Accept: application/json" -H "Content-Type: application/json" -d '{"email": "olegbabiy.ob@gmail.com", "password": "123456789", "password_confirmation": "123456789"}'
        curl -v localhost:5000/api/v1/auth/sign_in -X POST -H "Accept: application/json" -H "Content-Type: application/json" -d '{"email": "olegbabiy.ob@gmail.com", "password": "123456789"}'
        curl -v localhost:5000/api/v1/books -X GET -H 'Content-Type: application/json' -H 'access-token: lM_sZKwvk5yOSwkmsHC-BQ' -H 'client: lvLMUIVaNWrx9nTe1LmYIw' -H "uid: olegbabiy.ob@gmail.com"
      Is used for get all books
        curl localhost:5000/api/v1/books -X GET 
      Is used for get books by name and/or available with scope
        curl -v localhost:5000/api/v1/books -X GET -H "Accept: application/json" -H "Content-Type: application/json" -d '{"author": "Oleg", "available": true}'
      Is used for get books by all filelds with elasticsearch
        curl -v localhost:5000/api/v1/books/search -X GET -H "Accept: application/json" -H "Content-Type: application/json" -d '{"query": "Oleg"}'    
    EOS
  param_group :main_params
  def index; end

  api :POST, '/books', 'Create Book'
  description <<-EOS
    == Create Book article
    Is used for creating book
      curl http://localhost:5000/api/v1/books -v -X POST -F author='Oleg Babiy' -F text='blala' -F available='true' -F pages=3 -F book_content=@example.txt
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

  api :PUT, '/books/:id', 'Update book'
    description <<-EOS
      == Update book article
    Is used for updating book
      curl http://localhost:5000/api/v1/books/1 -v -X PUT -F author='Oleg Babiy' -F text='blala' -F available='true' -F pages=3 -F book_content=@example.txt
    EOS
  param_group :main_params
  def update; end

  api :DELETE, '/books/:id', 'Delete Book'
	description <<-EOS
	  == Delete single book
	  Is used for delete single book
	    curl -v localhost:5000/api/v1/books/31 -X DELETE -H "Accept: application/json" -H "Content-Type: application/json"
	  EOS
	param :id, Integer, desc: 'Id book for delete. '
	def destroy; end
end