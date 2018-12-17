class MealsController < ApplicationController
  def upcoming_meals
    @unconfirmed_meals = current_user.upcoming_unconfirmed_meals
    @attending = Attendee.find_by(user: current_user)
    @meals = current_user.upcoming_confirmed_and_cancelled_meals
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
       lat: @restaurant.latitude,
       infoWindow: { content: render_to_string(partial: "/meals/restaurant", locals: { restaurant: @restaurant }) }
     }
  end

  def reject
    @meal = Meal.find(params[:id])
    update_attendee_status(@meal, "Rejected")
    @meal.update(capacity: @meal.capacity + 1)
    redirect_to :upcoming_meals
  end

  def confirm
    @meal = Meal.find(params[:id])
    update_attendee_status(@meal, "Confirmed")
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
    attendee = Attendee.find_by(meal: meal, user: current_user)
    attendee.update(status: status)
    puts attendee.errors
  end
end
