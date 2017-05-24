module ProfilesDoc
	extend Apipie::DSL::Concern

	def_param_group :main_params do
    param :first_name, String, desc: 'The field name user. '
    param :last_name, String, desc: 'The text last name user. '
    param :user_id, Integer, desc: 'Id user. '
    param :avatar, String, desc: 'User avatar'
  end

  api :GET, '/profiles', 'All profiles'
  description <<-EOS
    == Get Action Profiles
    Is used for show profiles
      Is used for auth
        curl -v localhost:5000/api/v1/auth -X POST -H "Accept: application/json" -H "Content-Type: application/json" -d '{"email": "olegbabiy.ob@gmail.com", "password": "123456789", "password_confirmation": "123456789"}'
        curl -v localhost:5000/api/v1/auth/sign_in -X POST -H "Accept: application/json" -H "Content-Type: application/json" -d '{"email": "olegbabiy.ob@gmail.com", "password": "123456789"}'
        curl -v localhost:5000/api/v1/profiles -X GET -H 'Content-Type: application/json' -H 'access-token: lM_sZKwvk5yOSwkmsHC-BQ' -H 'client: lvLMUIVaNWrx9nTe1LmYIw' -H "uid: olegbabiy.ob@gmail.com"
      Is used for get all books
        curl localhost:5000/api/v1/profiles -X GET 
    EOS
  param_group :main_params
  param :created_at, Date, desc: 'Created at'
  param :updated_at, Date, desc: 'Updated at'
  def index; end

  api :GET, '/profiles/:id', 'Show Profile'
  description <<-EOS
    == Show single profile
    Is used for show single profile
      curl -v localhost:5000/api/v1/profiles/1
    EOS
  param :id, Integer, desc: 'Id profile for show. '
  def show; end

  api :PUT, '/profiles/:id', 'Update profile'
    description <<-EOS
      == Update profile user
      Is used for updating profile
        curl http://localhost:5000/api/v1/profiles/1 -X PUT -v -F first_name='Oleg' -F last_name='Babiy' -F file=@download.jpg
    EOS
  param_group :main_params
  def update; end
end