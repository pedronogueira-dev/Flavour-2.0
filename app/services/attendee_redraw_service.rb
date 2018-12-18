class AttendeeRedrawService
  def redraw
    meals = Meal.where("capacity >= 0 and capacity =< 8 and reservation_date >= current_date + 2")
    meals.each do |meal|
      reject_pending_invitations(meal) # REJECTS ALL ATTENDEES THAT HAVE YET TO ACCEPT THE EVENT
      location = meal.restaurant.location

      possible_users = get_possible_users(meal, location) # FINDS ALL THE USERS AVAILABLE DURING ON THE SAME DAY, THAT ARE NOT AMONG THE USERS CURRENT ATTENDING OR THAT HAVE NOT ACCEPTED THE INVITATION
      puts "\n--------------------------------------------------"
      puts "Finding new attendees for #{meal.reservation_date}"
      puts "Possible Users:\n #{possible_users.map(&:id)}"

      send_invite(possible_users, meal) unless possible_users.empty?

      puts "\n--------------------------------------------------"
    end
  end

  private
  def get_possible_users(meal, location)
    return User.joins(:availabilities).where.not(id: meal.users.select(:id).map(&:id)).where(location: location).where("availabilities.date = '#{meal.reservation_date}'").limit(meal.capacity)
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

  def reject_pending_invitations(meal)
    attendees_to_update = Attendee.find_by(meal:meal, status: "Invited")
    meal.update(capacity: meal.capacity + attendees_to_update)
    attendee_to_update.update(status: "Rejected")
  end
end
