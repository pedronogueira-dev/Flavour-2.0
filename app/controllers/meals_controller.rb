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

  def reject
    @meal = Meal.find(params[:id])
    update_attendee_status(@meal, "Rejected")
    @meal.update(capacity: @meal.capacity + 1)
    redirect_to :upcoming_meals
  end

  def accept
    @meal = Meal.find(params[:id])
    update_attendee_status(@meal, "Accepted")
    redirect_to :upcoming_meals
  end

  def register_today
    @user = current_user
    @meal = MealSchedulerService.new.register_to_event_today(@user)

    if @meal.nil?
      # redirect to dashboard and show flash of no meal found
    else
      redirect_to meal_path(@meal)
    end
  end

  private

  def update_attendee_status(meal, status)
    attendee = Attendee.where(meal: meal, user: current_user)
    attendee.update(status: status)
  end
end
