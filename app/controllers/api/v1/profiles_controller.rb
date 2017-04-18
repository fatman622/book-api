module Api
	module V1
		class ProfilesController < ApplicationController
			include ProfilesDoc
			include DeviseTokenAuth::Concerns::SetUserByToken
			before_action :authenticate_user!

			def index
				@profiles = Profile.all
				render json: @profiles
			end

			def create
				@profile = Profile.create(profile_params)
				if @profile.save
					render json: @profile, status: 201
				else
					render json: { errors: @profile.errors.full_messages }, status: 422
				end
			end

			def show
				render json: get_profile
			end

			def update
			  render json: get_profile.update(profile_params)
			end

			def destroy
				get_profile.destroy
				render :show, status: 204
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