class MealsController < ApplicationController
  def attendee_list
    @meal = Meal.find(params[:id])
    @attendees = @meal.attendees.where.not(user: current_user)
  end

  def upcoming_meals
    @unconfirmed_meals = current_user.upcoming_unconfirmed_meals
    @attending = Attendee.find_by(user: current_user)
    @meals = current_user.upcoming_confirmed_and_cancelled_meals
    byebug
  end

  def past_meals
    @user = current_user
    @meals = current_user.past_meals
  end

  def show
    @meal = Meal.find(params[:id])
    attendee = Attendee.find_by(meal: @meal, user: current_user)

    # redirect_to error_path("You don't have the permission to access the requested meal.") if attendee.nil?
    @status = attendee.status
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

  def contact_attendees
    sender = current_user
    recipient = Attendee.find(params[:id])
    meal = Meal.find(params[:meal_id])

    UserMailer.send_contacts(recipient, sender, meal).deliver_now
    redirect_to attendee_list_path(meal.id)
  end

  private

  def update_attendee_status(meal, status)
    attendee = Attendee.find_by(meal: meal, user: current_user)
    attendee.update(status: status)
    puts attendee.errors
  end
end
