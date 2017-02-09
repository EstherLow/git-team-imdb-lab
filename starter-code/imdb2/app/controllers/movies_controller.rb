class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update]

  def show
    @movie= movie.find(params[:id])
  end

  def new
    @movie = movie.new
  end

  def create
    @movie = movie.new(movie_params)
    @movie.save
    redirect_to @movie, notice: 'movie was successfully created.'
    # render :show, status: :created, location: @movie
    # end
  end

  def update
    respond_to do |format|
      if @movie.update(movie_params)
        upload
        format.html { redirect_to @movie, notice: 'movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_movie
    @movie = movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:name, :description, :picture,:id)
  end

end
