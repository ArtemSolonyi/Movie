class MoviesController < ApplicationController
  before_action :set_movie, only: %i[ show edit update destroy ]

  def index
    @category = Category.find_by(id:params[:id])
    @categories = [Category.new(name: 'All categories')] + Category.all
    p @categories
    if !@category
      @movies = Movie.all
    else
      @movies = @category.movies
    end
  end


  def show
  end

  def new
    if current_user.email != "my@mail.com"
      redirect_to movies_url
    else
      @movie = Movie.new

    end
  end

  def edit
  end

  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to movie_url(@movie), notice: "Movie was successfully created." }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to movie_url(@movie), notice: "Movie was successfully updated." }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @movie.destroy

    respond_to do |format|
      format.html { redirect_to movies_url, notice: "Movie was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_movie
    @movie = Movie.friendly.find(params[:id])
  end

  def movie_params
    puts params
    params.require(:movie).permit(:title, :text, :category_id)
  end
end
