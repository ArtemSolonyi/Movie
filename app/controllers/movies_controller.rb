class MoviesController < ApplicationController
  before_action :set_movie, only: %i[  edit update destroy show set_movie_rating]

  before_action :set_access_for_admin_page, only: %i[ new edit]
  before_action :set_user, only: %i[ show ]

  def index
    @category = Category.find_by(id: params[:id])
    @categories = [Category.new(name: 'All categories')] + Category.all

    if !@category
      @movies = Movie.all
    else
      @movies = @category.movies
    end
  end

  def show
  end

  def new
    @movie = Movie.new
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

  def set_movie_rating
    movie = @movie.rating.find_or_create_by!(user_id: current_user.id)
    movie.rating = params[:rating]
    movie.save
    @movie.rating_total = (((@movie.rating.each.sum { |n| p n.rating }).to_f) / (@movie.rating.length).to_f)
    @movie.save

    respond_to do |format|
      format.js { render partial: 'layouts/rating' }
    end
  end

  private

  def set_access_for_admin_page
    if current_user
      if current_user.email != "my@mail.com"
        redirect_to movies_url
      end
    end
    end

    def set_user
      if current_user
        if current_user.email == "my@mail.com"
          @user = true
        else
          @user = false
        end
      end
    end

    def set_movie
      @movie = Movie.friendly.find(params[:id])
    end

    def movie_params
      params.require(:movie).permit(:title, :text, :category_id, :url)
    end
  end
