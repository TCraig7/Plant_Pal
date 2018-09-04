class UsersController < ApplicationController
  before_action :set_params, only: [:show]

  def new
    @user = User.new
  end

  def show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  private

    def user_params
      params.require(:user).permit(:username, :password)
    end

    def set_params
      @user = User.find(params[:id])
    end
end
