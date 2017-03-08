module Api
	module V1
		class BooksController < ApplicationController
			before_action :set_book, only: [:show, :destroy]
			def index
				render json: Book.all
			end

			def create
				@book = Book.create(book_params)
				if @book.save
					render json: @book, status: 201
				else
					render json: { errors: @book.errors.full_messages }, status: 422
				end

			end

			def show
				render json: set_book
			end

			def destroy
				@book.destroy
				render :show, status: :ok
			end

			private
			def set_book
				@book = Book.find(params[:id])
			end

			def book_params
				params.permit(:autor, :text)
			end
		end
	end
end