module BooksDoc
	extend Apipie::DSL::Concern

	def_param_group :main_params do
    param :author, String, desc: 'The field note author book. '
    param :text, String, desc: 'The text book. '
    param :available, [true, false] , desc: 'Available book.'
    param :pages, Integer, desc: 'The count of pages. '
  end

  api :GET, 'https://book-api-fatman622.herokuapp.com/api/v1/books', 'All books '
  description <<-EOS
    == Get Action Books
    Is used for get all books
      curl localhost:5000/api/v1/books
    EOS
  param_group :main_params
  param :created_at, Date, desc: 'Created at'
  param :updated_at, Date, desc: 'Updated at'
  def index; end

  api :POST, 'https://book-api-fatman622.herokuapp.com/api/v1/books', 'Create Book'
  description <<-EOS
    == Create Book article
    Is used for creating book
      curl -v localhost:5000/api/v1/books -X POST -H "Accept: application/json" -H "Content-Type: application/json" -d '{"author": "Star Wars: A New Hope", "text": "asdasd", "available": "false", "pages": "23"}'
    EOS
  param_group :main_params
  def create; end  

  api :GET, 'https://book-api-fatman622.herokuapp.com/api/v1/books/:id', 'Show Book'
  description <<-EOS
    == Show single book
    Is used for show single book
      curl -v localhost:5000/api/v1/books/34
    EOS
  param :id, Integer, desc: 'Id book for show. '
  def show; end

  api :DELETE, 'https://book-api-fatman622.herokuapp.com/api/v1/books/:id', 'Delete Book'
	description <<-EOS
	  == Delete single book
	  Is used for delete single book
	    curl -v localhost:5000/api/v1/books/31 -X DELETE -H "Accept: application/json" -H "Content-Type: application/json"
	  EOS
	param :id, Integer, desc: 'Id book for delete. '
	def destroy; end
end