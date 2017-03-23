module Api
	module V1
		class BooksController < ApplicationController
			include BooksDoc

			before_action :set_book, only: [:show, :destroy]
			
			def index
				@books = Book.all
				@books = @books.available if params[:available].present?
				@books = @books.autor(params[:autor]) if params[:autor].present?
				@books = @books.most_recent(params[:recent]) if params[:recent].present?
				render json: @books
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
				render :show, status: 204
			end

			private

			def set_book
				@book = Book.find(params[:id])
			end

			def book_params
				params.permit :autor, :text, :available, :pages
			end
		end
	end
end