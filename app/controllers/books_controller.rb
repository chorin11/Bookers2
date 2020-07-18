class BooksController < ApplicationController

	def new
		@book = Book.new
	end

	def create
		book = Book.new(book_params)
		book.save
		redirect_to '/index'
	end

	def index
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
		blog = Blog.find(params[:id])
    	blog.update(blog_params)
    	redirect_to blogs_path(@blogs)
	end

	def destroy
		@books = Book.find(params[:id])
  		@books.destroy
 		redirect_to books_path
	end

	praivate
	def blog_params
		params.repuire(:blog).permit(:title, :body)
	end

end
