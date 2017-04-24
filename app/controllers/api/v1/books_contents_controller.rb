module Api
  module V1
    class BooksContentsController < ApplicationController
      include BooksContentsDoc
      include DeviseTokenAuth::Concerns::SetUserByToken
      before_action :authenticate_user!
      
      def index
        @books_contents = BookContent.all
        render json: @books_contents, status: :ok
      end

      def show
        render json: book_content, status: :ok
      end

      def create
        @book_content = BookContent.create(book_content_params)
        if @book_content.save
          render json: @book_content, status: :created
        else
          render json: { errors: @book_content.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        @book_content = book_content.update(book_content_params)
        if @book_content
          render json: @book_content, status: :created
        else
          render json: { errors: @book_content.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        render json: book_content.destroy, status: :no_content
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