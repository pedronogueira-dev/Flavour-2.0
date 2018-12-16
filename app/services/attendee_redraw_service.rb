class AttendeeRedrawService
  def redraw
    meals = Meal.where("capacity > 0 and capacity < 8 and reservation_date >= current_date + 2")
    meals.each do |meal|
      location = meal.restaurant.location
      # possible_users = User.joins(:availabilities).where.not(id: meal.users.select(:id).map(&:id)).where(location: location).where("availabilities.date = '#{meal.reservation_date}'").limit(meal.capactiy)
      puts "\n--------------------------------------------------"
      puts "Finding new attendees for #{meal}"
      puts "Possible Users:\n #{possible_users.map(&:id)}"
      send_invite(get_possible_users(meal, location), meal) unless possible_users.empty

      puts "\n--------------------------------------------------"
    end
  end

  private

  def get_possible_users(meal, location)
    return User.joins(:availabilities).where.not(id: meal.users.select(:id).map(&:id)).where(location: location).where("availabilities.date = '#{meal.reservation_date}'").limit(meal.capactiy)
  end
  def send_invite(users, meal)
    number_of_invitations = 0
    users.each do |user|
      invite = Attendee.new(user: user, meal: meal, status: "Invited")
      if invite.save
        number_of_invitations += 1
      end
    end
    puts "Sent #{number_of_invitations} invites"
    meal.update(capacity: meal.capacity + number_of_invitations) if number_of_invitations > 0
  end
end
