module Api
	module V1
		class BooksController < ApplicationController
			include BooksDoc
			include DeviseTokenAuth::Concerns::SetUserByToken
			before_action :authenticate_user!
			before_action :get_book, only: [:show, :destroy]
			respond_to :json
			
			def index
				@books = Book.all
				@books = @books.author(params[:author].downcase) if params[:author].present?
				@books = @books.available(params[:available]) if params[:available].present?
				respond_with @books, status: :ok
			end

			def create
				@book = Book.create(book_params)
				if @book.save
					respond_with @book, status: :created
				else
					respond_with @book, errors: @book.errors.full_messages, status: :unprocessable_entity
				end
			end

			def show
				respond_with get_book, status: :ok
			end

			def update
				@book = get_book.update(book_params)
				if @book
					respond_with :api, :v1, status: :created
				else
					respond_with :api, :v1, errors: @book.errors.full_messages, status: :unprocessable_entity
				end
			end

			def destroy
				@book.destroy
				respond_with :api, :v1, status: :no_content
			end

			def search
			  if params[:query].nil?
			    @books = []
			  else
			    @books = Book.search params[:query]
			  end
			  respond_with @books, staus: :ok
			end

			private
			def get_book
				@book = Book.find(params[:id])
			end

			def book_params
				params.require(:book).permit(:author, :text, :available, :pages)
			end
		end
	end
end