module BooksDoc
	extend Apipie::DSL::Concern

	def_param_group :main_params do
    param :autor, String, desc: 'The field note author book. '
    param :text, String, desc: 'The text book. '
    param :available, [true, false] , desc: 'Available book.'
    param :pages, Integer, desc: 'The count of pages. '
  end

  api :GET, '/books', 'All books '
  description <<-EOS
    == Get Action Books
    Is used for get all books
      curl localhost:3000/api/v1/books
    EOS
  param_group :main_params
  param :created_at, Date, desc: 'Created at'
  param :updated_at, Date, desc: 'Updated at'
  def index; end

  api :POST, '/books', 'Create Book'
  description <<-EOS
    == Create Book article
    Is used for creating book
      curl -v localhost:3000/api/v1/books
    EOS
  param_group :main_params
  def create; end

  api :GET, '/books/:id', 'Show Book'
  description <<-EOS
    == Show single book
    Is used for show single book
      curl -v localhost:3000/api/v1/books/:id
    EOS
  param :id, Integer, desc: 'Id book for show. '
  def show; end

  api :DELETE, '/books/:id', 'Delete Book'
	description <<-EOS
	  == Delete single book
	  Is used for delete single book
	    curl -v localhost:3000/api/v1/books/:id
	  EOS
	param :id, Integer, desc: 'Id book for delete. '
	def destroy; end
end