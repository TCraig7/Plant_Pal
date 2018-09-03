class CategoriesController < ApplicationController
  before_action :set_params, only: [:show, :destroy]
  def index
    @categories = Category.all
  end

  def show
  end

  def destroy
    @category.destroy
    redirect_to categories_path
  end

  private

  def set_params
    @category = Category.find(params[:id])
  end
end
