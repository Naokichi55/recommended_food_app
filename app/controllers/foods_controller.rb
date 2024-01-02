# frozen_string_literal: true

class FoodsController < ApplicationController
  before_action :set_food, only: %i[edit update destroy]

  def index
    @foods = Food.includes(:user, :likes).order(:created_at)
  end

  def show
    @food = Food.find(params[:id])
  end

  def new
    @food = Food.new
  end

  def edit; end

  def create
    food = current_user.foods.create!(food_params)
    redirect_to food
  end

  def update
    @food.update!(food_params)
    redirect_to @food
  end

  def destroy
    @food.destroy!
    redirect_to root_path
  end

  private

  def food_params
    params.require(:food).permit(:name, :avatar, :comment)
  end

  def set_food
    @food = current_user.foods.find(params[:id])
  end
end
