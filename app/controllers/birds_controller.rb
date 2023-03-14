class BirdsController < ApplicationController
  def index
    render json: Bird.all
  end

  def show
    birds = Bird.all.find(params[:id])
    if birds
      render json: birds
    else
      render json: {error: 'No valid input'} , status: :not_found
    end
  end
end
