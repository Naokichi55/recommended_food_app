# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :set_post

  def create
    current_user.likes.create!(food_id: @food.id)
  end

  def destroy
    current_user.likes.find_by(food_id: @food.id).destroy
  end

  private

  def set_post
    @food = Food.find(params[:food_id])
  end
end
