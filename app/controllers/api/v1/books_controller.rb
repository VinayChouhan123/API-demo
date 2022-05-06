module Api
  module V1
    class BooksController < ApplicationController

      # class Api::V1::BooksController < ApplicationController
      #   protect_from_forgery with: :null_session

      def index
        render json: Book.all
      end


      def create
        book = Book.new(book_params)

        if book.save
          render json: book, status: :created
        else
          render json: book.errors, status: :unprocessable_entity
        end
      end

      def edit
        @book = Book.find(params[:id]) 
      end

      def update
        @book = Book.find(params[:id])

        if @book.update(book_params)
          render json: @book
        else
          render json: @book
        end 
      end

      def destroy
        Book.find(params[:id]).destroy!

        head :no_content
      end

      def book_params
        params.require(:book).permit(:title, :auther)
      end
    end
  end

end
