class ActorsController < ApplicationController

  def show
    @movies = Movie.all
  end

  def new
    @movie = Movie.find(params[:id])
    render :new
  end

  def create
    @movie = Movie.create(movie_params)
    redirect_to root_path
  end

  def edit
    @movie = Movie.find(params[:id])

  end

  private

  def movie_params

  end


end
