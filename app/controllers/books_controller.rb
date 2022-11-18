class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]
  before_action :set_authors
  # GET /books or /books.json
  def index
    pages    = Book.options_page(params[:pages])
    filtered = Book.includes(:authors)

    filtered = filtered.filter_by_authors(params[:author_ids]) if params[:author_ids].present?
    filtered = filtered.filter_by_years(params[:years]) if params[:years].present?
    filtered = filtered.filter_by_pages(pages) if pages.present?
    filtered = filtered.filter_by_keyword(params[:keyword]) if params[:keyword].present?
    @pagy, @books = pagy(filtered.order(created_at: :desc), items: 10)
  end

  # GET /books/1 or /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books or /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to book_url(@book), notice: "Book was successfully created." }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        # format.turbo_stream do
        #   render turbo_stream: turbo_stream.replace(@book, 'show')
        # end
        format.html { redirect_to book_url(@book), status: :see_other, notice: "Book was successfully updated." }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1 or /books/1.json
  def destroy
    @book.destroy!

    respond_to do |format|
      format.html { redirect_to books_url, notice: "Book was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:content_name, :isbn, :original_title, :year, :language_code, :category, :plot, :copyright, :title, :average_rating, :rating_count, :description, :loc_class, :language, :pages, :isbn13, :release_date, :cover, :summary, :content_cleaned, :content_available, author_ids: [])
    end

    def set_authors
      @authors = Author.all
    end
end
