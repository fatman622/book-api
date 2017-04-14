module Api
  module V1
    class ReadmesController < ApplicationController
      include ReadmesDoc
      include DeviseTokenAuth::Concerns::SetUserByToken
      before_action :authenticate_user!
      def index
        render json: Readme.all
      end

      def show
        render json: readme
      end

      def create
        @readme = Readme.create(readme_params)
        if @readme.save
          render json: @readme, status: 201
        else
          render json: { errors: @readme.errors.full_messages }, status: 422
        end
      end

      def update
        render json: readme.update(readme_params)
      end

      def destroy
        render json: readme.destroy, status: 204
      end

      private

      def readme
        Readme.find(params[:id])
      end

      def readme_params
        params.permit :text
      end
    end
  end
end