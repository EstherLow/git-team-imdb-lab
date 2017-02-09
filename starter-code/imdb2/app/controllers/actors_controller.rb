class ActorsController < ApplicationController

  before_action :set_actor, only: [:show, :edit, :update]

  def show
    @actor= Actor.find(params[:id])
  end

  def new
    @actor = Actor.new
  end

  def create
    @actor = Actor.new(actor_params)
    @actor.save
    redirect_to @actor, notice: 'Actor was successfully created.'
    # render :show, status: :created, location: @actor
    # end
  end

  def update
    respond_to do |format|
      if @actor.update(actor_params)
        upload
        format.html { redirect_to @actor, notice: 'actor was successfully updated.' }
        format.json { render :show, status: :ok, location: @actor }
      else
        format.html { render :edit }
        format.json { render json: @actor.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_actor
    @actor = Actor.find(params[:id])
  end

  def actor_params
    params.require(:actor).permit(:name, :description, :picture,:id)
  end

end
