class PlantsController < ApplicationController
  before_action :set_params, only: [:show, :destroy, :edit, :update]

  def index
    @plants = Plant.all
  end

  def show
    @note = Note.new
    @note.plant_id = @plant.id
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

  def edit
  end

  def update
    @plant.update(plant_params)

    redirect_to plant_path(@plant)
  end

  def destroy
    @plant.destroy
    redirect_to plants_path
  end

  private

  def plant_params
    params.require(:plant).permit(:species, :nickname, :amount_of_water, :amount_of_sun, :category_list)
  end

  def set_params
    @plant = Plant.find(params[:id])
  end
end
