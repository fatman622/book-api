module ReadmesDoc
	extend Apipie::DSL::Concern

	def_param_group :main_params do
		param :id, Integer, desc: 'The id readme. '
    param :text, String, desc: 'The text readme. '
  end


  api :GET, '/readmes', 'All readmes '
  description <<-EOS
    == Get Action Readmes
    Is used for show readmes
      Is used for auth
        curl -v localhost:5000/api/v1/auth -X POST -H "Accept: application/json" -H "Content-Type: application/json" -d '{"email": "olegbaby@gmail.com", "password": "123456789", "password_confirmation": "123456789"}'
        curl -v localhost:5000/api/v1/auth/sign_in -X POST -H "Accept: application/json" -H "Content-Type: application/json" -d '{"email": "olegbaby@gmail.com", "password": "123456789"}'
        curl -v localhost:5000/api/v1/readmes -X GET -H 'Content-Type: application/json' -H 'access-token: lM_sZKwvk5yOSwkmsHC-BQ' -H 'client: lvLMUIVaNWrx9nTe1LmYIw' -H "uid: olegbaby@gmail.com"
      Is used for get all readmes
        curl localhost:5000/api/v1/readmes -X GET 
    EOS
  param_group :main_params
  def index; end

 	api :POST, '/readmes', 'Create readme'
    description <<-EOS
      == Create readme article
      Is used for creating readme
        curl -v localhost:5000/api/v1/readmes -X POST -H "Accept: application/json" -H "Content-Type: application/json" -d '{"text": "some text test"}'
    EOS
  param_group :main_params
  def create; end
   
	api :GET, '/readmes/:id', 'Show readme'
    description <<-EOS
      == Show single readme
      Is used for show single readme
        curl -v localhost:5000/api/v1/readmes/1
    EOS
  param :id, Integer, desc: 'The id readme. '
  def show; end

  api :PUT, '/readmes/:id', 'Update readme'
    description <<-EOS
      == Update readme article
      Is used for updating readme
        curl -v localhost:5000/api/v1/readmes/1 -X PUT -H "Accept: application/json" -H "Content-Type: application/json" -d '{"text": "some text test"}'
    EOS
  param_group :main_params
  def update; end

  api :DELETE, '/readmes/:id', 'Delete readme'
    description <<-EOS
  	  == Delete single readme
  	  Is used for delete single readme
  	    curl -v localhost:5000/api/v1/readmes/1 -X DELETE -H "Accept: application/json" -H "Content-Type: application/json"
    EOS
 	param :id, Integer, desc: 'The id readme. '
	def destroy; end

end
