class  BooksController < ApplicationController
	before_action :authenticate_user!
	before_action :correct_user, only: [:edit, :update, :destroy]

 def correct_user
   @book = Book.find(params[:id])
   if @book.user_id != current_user.id
     redirect_to books_path
   end
 end

  def show
		@book = Book.find(params[:id])
		@user = @book.user
		@books = Book.new

  end

  def index
		@books = Book.all
		@book = Book.new
  end

  def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
  	if @book.save
  		redirect_to @book, notice: "successfully created book!"
  	else
			@books = Book.all
  		render action: :index
  	end
  end

  def edit
		@book = Book.find(params[:id])
		 if @book.user == current_user
		  render :edit
		 else
		  redirect_to books_path
		 end
  end

  def update
  	@book = Book.find(params[:id])
  	 #if @book.user != current_user
  	  # redirect_to @book
  	# else
      if @book.update(book_params)
  		  redirect_to @book, notice: "successfully updated book!"
   	  else
			  render "edit"
			end
  	 #end
  end

  def destroy
  	@book = Book.find(params[:id])
  	if @book.user != current_user
  	  redirect_to books_path, notice: "successfully delete book!"
  	else
  	  @book.destroy
  	  redirect_to books_path
  	end
  end


  private

  def book_params
  	params.require(:book).permit(:title, :body)
  end

end