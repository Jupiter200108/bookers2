class BooksController < ApplicationController
  
  def new
    @book = Book.new
    @books = Book.page(params[:page])
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path
    else
      render :index
    end
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to book_path
  end

  def show
    @user = User.find(params[:id])
    @books = @user.post_images.page(params[:page])
  end
  
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
