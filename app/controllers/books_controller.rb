class BooksController < ApplicationController
    def index
        @books = Book.all
    end
    def new
        @book = Book.new
    end
    def create
        @book = Book.new(params_book)
        if @book.save
          flash[:notice] = "book successfully created"
          redirect_to '/books'
        else
          flash[:notice] = "Something went wrong"
          render :new
        end
    end
    
    def show
      @book = Book.find_by(id: params[:id])
    end
    
    def edit
      @book = Book.find_by(id: params[:id])
    end
    
    def edit
      @book = Book.find_by(id: params[:id])
    end
    
    def update
      @book = Book.find_by(id: params[:id])
        if @book.update(params_book)
          flash[:notice] = "book successfully updated"
          redirect_to '/books'
        else
          flash[:notice] = "Something went wrong"
          render :edit
        end
    end
    def destroy
      @book = Book.find_by(id: params[:id])
      @book.destroy
      redirect_to '/books'
    end
        
    private
    def params_book
      params.require(:book).permit(:title, :price, :publishing, :author, :intro)
    end
    
    
end
