module Api
  module V1
    class BooksContentsController < ApplicationController
      include BooksContentsDoc
      include DeviseTokenAuth::Concerns::SetUserByToken
      before_action :authenticate_user!
      def index
        render json: BookContent.all
      end

      def show
        render json: book_content
      end

      def create
        @book_content = BookContent.create(book_content_params)
        if @book_content.save
          render json: @book_content, status: 201
        else
          render json: { errors: @book_content.errors.full_messages }, status: 422
        end
      end

      def update
        render json: book_content.update(book_content_params)
      end

      def destroy
        render json: book_content.destroy, status: 204
      end

      private

      def book_content
        BookContent.find(params[:id])
      end

      def book_content_params
        params.permit :text
      end
    end
  end
end