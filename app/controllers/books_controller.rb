class BooksController < ApplicationController

	before_action :authenticate_user!
	before_action :correct_user, only: [:edit, :update]

	def create
		@book = Book.new(book_params)
		@book.user = current_user
		if @book.save
			flash[:notice] = "Book was successfully created."
			redirect_to book_path(@book)
		else
			@books = Book.all
			render :index
		end
	end

	def index
		@books = Book.all	
		@book = Book.new
	end

	def show
		@book = Book.find(params[:id])
		@new_book = Book.new
		@post_comment = PostComment.new
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
			flash[:notice] = "Book was successfully updated."
			redirect_to book_path(@book)
		else
			render :edit
		end
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to books_path
	end

	private
	def book_params
		params.require(:book).permit(:title, :body)
	end

	def correct_user
      @book = Book.find(params[:id])
      redirect_to books_path unless @book.user == current_user
    end

end
 