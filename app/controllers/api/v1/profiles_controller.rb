module Api
	module V1
		class ProfilesController < ApplicationController
			include ProfilesDoc
			include DeviseTokenAuth::Concerns::SetUserByToken
			before_action :authenticate_user!

			def index
				@profiles = Profile.all
				render json: @profiles, status: 200
			end

			def show
				if _current_profile
					render json: get_profile, status: 200
				end
			end

			def update
			  @profile = _current_profile.update(profile_params)
				if @profile
					render json: @profile, status: 201
				else
					render json: { errors: @profile.errors.full_messages }, status: 422
				end
			end

			private
			def get_profile
				@profile = Profile.find(params[:id])
			end

			def profile_params
				params.permit :first_name, :last_name, :avatar
			end
		end
	end
end