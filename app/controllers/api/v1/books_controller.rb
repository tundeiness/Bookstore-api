class Api::V1::BooksController < Api::V1::ApiController
  before_action :set_book, only: %i[show update destroy]

  def index
    @books = params[:category] ? Book.categorized(params[:category]) : Book.all
     render json: @books
  end


  def show
    render json: @book
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      render json: @book, status: :created
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  def update
    if @book.update(book_params)
      render json: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @book.destroy
  end

  private
    def set_book
      @book ||= Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:id, :title, :category)
    end
end
