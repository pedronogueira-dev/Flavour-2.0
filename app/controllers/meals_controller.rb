class MealsController < ApplicationController
  def upcoming_meals
    @meals = Meal.where(['reservation_date >= ?', DateTime.now])
    @attending = Attendee.find_by(user: current_user)
  end

  def past_meals
    @meals = current_user.past_meals
  end

  def show
    # meal
    # restaurant info
    # attendee info if date > current_date

  end
end
