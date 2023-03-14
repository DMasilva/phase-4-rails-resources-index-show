class BirdsController < ApplicationController
  wrap_parameters format: []
  def index
    render json: Bird.all, only: [:id, :name, :species]
  end

  def show
    birds = Bird.all.find(params[:id])
    if birds
      render json: birds, only: [:id, :name, :species]
    else
      render json: {error: 'No valid input'} , status: :not_found
    end
  end

  def create
    bird= Bird.create(bird_params)
    render json: bird, status: :created
  end

  private

  def bird_params
    params.permit(:name, :species)
  end
end
