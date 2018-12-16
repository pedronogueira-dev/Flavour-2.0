class MealsController < ApplicationController
  def upcoming_meals
    @meals = Meal.where(['reservation_date > ?', DateTime.now])
    @attending = Attendee.find_by(user: current_user)
  end

  def past_meals
  end

  def show
    #@meals = Meal.find(meal_params[:id])
  end

  private

  def meal_params
    #params.require(:meal).permit(:name, :rating)
  end
end
