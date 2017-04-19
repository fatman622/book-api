module Api
	module V1
		class BooksController < ApplicationController
			include BooksDoc
			include DeviseTokenAuth::Concerns::SetUserByToken
			before_action :authenticate_user!
			before_action :get_book, only: [:show, :destroy]
			
			def index
				@books = Book.all
				@books = @books.author(params[:author].downcase) if params[:author].present?
				@books = @books.available(params[:available]) if params[:available].present?
				render json: @books, status: 200
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
				render json: get_book, status: 200
			end

			def update
				@book = get_book.update(book_params)
				if @book
					render json: @book, status: 201
				else
					render json: { errors: @book.errors.full_messages }, status: 422
				end
			end

			def destroy
				@book.destroy
				render :show, status: 204
			end

			def search
			  if params[:query].nil?
			    @books = []
			  else
			    @books = Book.search params[:query]
			  end
			  render json: @books, staus: 200
			end

			private
			def get_book
				@book = Book.find(params[:id])
			end

			def book_params
				params.permit :author, :text, :available, :pages
			end
		end
	end
end