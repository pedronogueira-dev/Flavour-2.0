class MealCancelationService

  def cancel_meals
    meals = Meal.where("reservation_date <= current_date + 2 and capacity >= 5") # find every meal happening in the space of 2 days with 4 or less people attending
    meals.each do { |meal|
      meal.attendees.update_all(status: "Cancelled")  # the status of the attendee was changed to cancelled so that the users may get a visual representation of the event
      meal.update(capacity: 8)  # the capacity of the event was reset to 8 because no one will be attending it. this will allow for the destruction of the meal after it's reservation_date
    }
  end

  def delete_cancelled_meals
    Meal.where("reservation_date < current_date and capacity = 8").destroy_all
  end

end
