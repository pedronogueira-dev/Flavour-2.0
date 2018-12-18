module ApplicationHelper
  def icon_active?(view)
    return if devise_controller?
    case view
    when 'dashboard'
      dashboard_page?
    when 'availability'
      availability_page?
    when 'upcoming'
      upcoming_page?
    when 'past'
      past_page?
    when 'interests'
      interests_page?
    end
  end

  def dashboard_page?
    current_page?(controller: 'users', action: 'dashboard')
  end

  def availability_page?
    current_page?(controller: 'availabilities', action: 'index')
  end

  def upcoming_page?
    current_page?(controller: 'meals', action: 'upcoming_meals')
  end

  def past_page?
    current_page?(controller: 'meals', action: 'past_meals')
  end

  def  interests_page?
    current_page?(controller: 'user_interests', action: 'edit')
  end
end
