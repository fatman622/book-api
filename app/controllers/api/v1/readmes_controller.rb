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
        render json: Readme.create(readme_params)
      end

      def update
        render json: readme.update(readme_params)
      end

      def destroy
        render json: readme.destroy
      end

      private

      def readme
        Readme.find(params[:id])
      end

      def readme_params
        params.require(:readme).permit(:text)
      end
    end
  end
end