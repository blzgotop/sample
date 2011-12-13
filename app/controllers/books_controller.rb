class BooksController < ApplicationController
  # GET /books
  # GET /books.json

    SORTS = {
    "1" => "name",
    "2" => "Price Low to High",
    "3"=>  "Price High to Low",
    "4" => "Brand A-Z",
    "5" => "Brand Z-A"
  }
  def index
    @books = Book.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @books }
    end
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @book = Book.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @book }
    end
  end

  # GET /books/new
  # GET /books/new.json
  def new
    @book = Book.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @book }
    end
  end

  # GET /books/1/edit
  def edit
    @book = Book.find(params[:id])
    puts @book
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(params[:book])

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render json: @book, status: :created, location: @book }
      else
        format.html { render action: "new" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /books/1
  # PUT /books/1.json
  def update
    @book = Book.find(params[:id])

    respond_to do |format|
      if @book.update_attributes(params[:book])
        format.html { redirect_to '/', notice: 'Book was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    respond_to do |format|
      format.html { redirect_to books_url }
      format.json { head :ok }
    end
  end

  def get_bestbuy_data()
    data_hc = HTTPClient.new
    bestbuy_data = Hash.new
    big_category = "Televisions"
    middle_category = "All-Flat-Panel-TVs"
    # ポストのURL
    post_url = "http://www.bestbuy.com/site/" + big_category + middle_category

    post_file = {["big_category"]=>  big_category,
      ["middle_category"]=> middle_category}
    begin
      result = data_hc.post(post_url, post_file, "content-type" => "multipart/form-data").content
      puts Kconv.tosjis(result.to_s)
      # moodleのユーザーIDはユーザー結果で検索する
      #      scorm_view = result[/mtop_scorm_report.*mtop_scorm_report/]
      #      study_progress = result[/mtop_scorm_study_progress.*mtop_scorm_study_progress/]
      #      test_score = result[/mtop_scorm_test_score.*mtop_scorm_test_score/]
      #      start_time = result[/mtop_scorm_start_time.*mtop_scorm_start_time/]
      #      end_time = result[/mtop_scorm_end_time.*mtop_scorm_end_time/]
      #      return scorm_score
    rescue
      #       raise I18n.t("moodle.moodle_host_error")
    end
  end
end
