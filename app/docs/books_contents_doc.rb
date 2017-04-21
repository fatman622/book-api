module BooksContentsDoc
	extend Apipie::DSL::Concern

	def_param_group :main_params do
		param :id, Integer, desc: 'The id book content. '
    param :text, String, desc: 'The text book content. '
  end


  api :GET, '/readmes', 'All Books contents '
  description <<-EOS
    == Get Action Books Contents
    Is used for show books content
      Is used for auth
        curl -v localhost:5000/api/v1/auth -X POST -H "Accept: application/json" -H "Content-Type: application/json" -d '{"email": "olegbabiy.ob@gmail.com", "password": "123456789", "password_confirmation": "123456789"}'
        curl -v localhost:5000/api/v1/auth/sign_in -X POST -H "Accept: application/json" -H "Content-Type: application/json" -d '{"email": "olegbabiy.ob@gmail.com", "password": "123456789"}'
        curl -v localhost:5000/api/v1/books_contents -X GET -H 'Content-Type: application/json' -H 'access-token: lM_sZKwvk5yOSwkmsHC-BQ' -H 'client: lvLMUIVaNWrx9nTe1LmYIw' -H "uid: olegbabiy.ob@gmail.com"
      Is used for get all readmes
        curl localhost:5000/api/v1/books_contents -X GET 
    EOS
  param_group :main_params
  def index; end

 	api :POST, '/books_contents', 'Create book content'
    description <<-EOS
      == Create book content article
      Is used for creating book content
        curl -v localhost:5000/api/v1/books_contents -X POST -H "Accept: application/json" -H "Content-Type: application/json" -d '{"text": "some text test"}'
    EOS
  param_group :main_params
  def create; end
   
	api :GET, '/books_contents/:id', 'Show book_content'
    description <<-EOS
      == Show single book content
      Is used for show single book content
        curl -v localhost:5000/api/v1/books_contents/1
    EOS
  param :id, Integer, desc: 'The id book content. '
  def show; end

  api :PUT, '/books_contents/:id', 'Update book content'
    description <<-EOS
      == Update book content article
      Is used for updating book content
        curl -v localhost:5000/api/v1/books_contents/1 -X PUT -H "Accept: application/json" -H "Content-Type: application/json" -d '{"text": "text test"}'
    EOS
  param_group :main_params
  def update; end

  api :DELETE, '/books_contents/:id', 'Delete book content'
    description <<-EOS
  	  == Delete single books contents
  	  Is used for delete single books contents
  	    curl -v localhost:5000/api/v1/books_contents/1 -X DELETE -H "Accept: application/json" -H "Content-Type: application/json"
    EOS
 	param :id, Integer, desc: 'The id book content. '
	def destroy; end

end
