class MealsController < ApplicationController
  def upcoming_meals
    @meals = Meal.where(['reservation_date >= ?', DateTime.now])
    @attending = Attendee.find_by(user: current_user)
  end

  def past_meals
    @meals = current_user.past_meals
  end

  def show
    @meal = Meal.find(params[:id])
    #@meals = Meal.restaurants.where.not(latitude: nil, longitude: nil)
    @restaurant = @meal.restaurant
    @marker = {
       lng: @restaurant.longitude,
       lat: @restaurant.latitude
     }
  end

  private

  def meal_params
    #params.require(:meal).permit(:name, :rating)
  end
end
