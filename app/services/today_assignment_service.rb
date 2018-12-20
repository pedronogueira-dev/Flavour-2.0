class TodayAssignmentService
  MEALS_ON_SAME_LOCATION_QUERY = "Select meals.* \
                                  from meals \
                                  join restaurants
                                    on meals.restaurant_id = restaurants.id \
                                  where meals.reservation_date = current_date and restaurants.location = "

  def self.assign_meal_today(user_id)
    user = User.find(user_id)
    user.meals.where(reservation_date: Date.today).each do |meal|
      attending = Attendee.find_by(user: user, meal: meal)
      return nil if %w(Confirmed Invited).include? attending.status
    end

    meals = Meal.find_by_sql("#{MEALS_ON_SAME_LOCATION_QUERY}\'#{user.location}\'")
    meals.each do |meal|

      user_attended = meal.attendees.find_by(user: user, status: "Rejected")
      attendees = meal.attendees.where(status: "Confirmed").or(meal.attendees.where(status: "Invited"))
      if attendees.count > 0 && attendees.count < 8 && user_attended.nil?
        Attendee.create(meal: meal, user: user, status: "Invited")
        meal.capacity -= 1
        meal.save
        return meal
      end
    end
    return nil
  end
end
