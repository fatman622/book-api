module Api
	module V1
		class ProfilesController < ApplicationController
			include ProfilesDoc
			include DeviseTokenAuth::Concerns::SetUserByToken
			before_action :authenticate_user!
			# respond_to :json

			def index
				@profiles = Profile.all
				respond_with @profiles, status: 200
			end

			def show
				respond_with get_profile, status: 200
			end

			def update
			  @profile = _current_profile.update(profile_params)
				if @profile
					respond_with @profile, status: 201
				else
					respond_with errors: @book_content.errors.full_messages, status: 422
				end
			end

			private
			def get_profile
				@profile = Profile.find(params[:id])
			end

			def profile_params
				params.permit :first_name, :last_name, :avatar
			end

			def _current_profile
				@current_profile = current_user.profile
			end
		end
	end
end