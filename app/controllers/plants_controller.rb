class PlantsController < ApplicationController
  def index
    @plants = Plant.all
  end

  def show
    @plant = Plant.find(params[:id])
  end

  def new
    @plant = Plant.new
  end

  def create
    plant = Plant.new(plant_params)
    if plant.save
      flash[:success] = "#{plant.species} added!"
      redirect_to plant_path(plant)
    else
      flash[:failure] = 'Sorry, please fill out the whole form to create a plant.'
      redirect_to new_plant_path
    end
  end

  private

  def plant_params
    params.require(:plant).permit(:species, :nickname, :amount_of_water, :amount_of_sun)
  end
end
