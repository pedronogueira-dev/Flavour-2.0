class MealSchedulerService
  MINIMUM_PEOPLE = 6  # Minimum amount of people necessary to from a meal
  MAXIMUM_PEOPLE = 8  # Maximum amount of people allowed for a meal
  MINIMUM_DAYS = 1

# TODO INCLUDE INTEREST SEARCH

  USER_AVAILABILITY_QUERY = "SELECT users.location, availabilities.date, count(users.*), array_agg(users.id) AS user_ids \
                            FROM users \
                            JOIN availabilities \
                            ON availabilities.user_id = users.id \
                            GROUP BY users.location, \
                                      availabilities.date \
                            HAVING count(users.*) >= #{MINIMUM_PEOPLE} \
                            AND availabilities.date > current_date + #{MINIMUM_DAYS} \
                            ORDER BY date ASC, \
                                    count(users.*) DESC;"
  def initialize
  end

  def create_events
    possible_events = User.find_by_sql(USER_AVAILABILITY_QUERY)

    possible_events.each do |day|
      location = day.location
      reservation_date = day.date

      invites = gather_possible_invites(day.user_ids, reservation_date)

      if invites.count > MINIMUM_PEOPLE
      #  byebug
        new_event = Meal.new(reservation_date: reservation_date, restaurant: Restaurant.where(location: location).sample)
        if new_event.save
          puts "\n------------------------------"
          puts "Created #{Meal.last}"
          send_invites(new_event, invites)
          puts "------------------------------\n"
        end
      end
    end
  end

  def register_to_event_today(user)
    possible_meals = Meal.where("reservation_date = current_date and capacity >= #{MINIMUM_PEOPLE} and capacity < #{MAXIMUM_PEOPLE}").limit(1)
    if possbile_meals.empty?
      # Return nil -> on the controller side, redirect to dashboard with no match flash rendered
      return nil
    else
      Attendee.create(user:user, meal:possible_meals.first, status: "Invited")
      # Return Meal, redirect to meal page for confirmation
      return possible_meals.first
    end
  end

  private

  def gather_possible_invites(user_ids, reservation_date)
    invites = []
    existing_meal = false
    user_ids.each do |user_id|
      user = User.find(user_id)
      user.upcoming_meals.each do |meal|
        if meal.reservation_date == reservation_date
          existing_meal = true
          break
        elsif meal.reservation_date > reservation_date
          break
        end
      end
      # byebug
      invites << { user_id: user_id, status: "Invited" } unless existing_meal
    end

    return invites
  end

  def send_invites(meal, invites)
    invites.shift(MAXIMUM_PEOPLE).each do |invite|
      invite[:meal] = meal
      Attendee.create(invite)
      puts "\tCREATED #{Attendee.last}"
    end
  end
# location | date | count | user_ids
# if

# possible attendee:
# belongs to a group of users with the following
## => Availability on the same day
## => Same location
## => Not attending any event on the same day
## => The sum of users is greater then the minimun amount required
end


