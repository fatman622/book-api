module Api
	module V1
		class ProfilesController < ApplicationController
			include ProfilesDoc
			include DeviseTokenAuth::Concerns::SetUserByToken
			before_action :authenticate_user!

			def index
				@profiles = Profile.all.select do |p|
					p != _current_profile
				end
				render json: @profiles, status: :ok
			end

			def show
				render json: get_profile, status: :ok
			end

			def update
			  @profile = _current_profile.update(profile_params)
				if @profile
					render json: @profile, status: :created
				else
					render json: { errors: @book_content.errors.full_messages }, status: :unprocessable_entity
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