class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_create :create_user_interests

  LOCATIONS = ["Greater Lisbon", "Porto", "New York City", "Chicago", "Dallas", "Yorkshire", "London", "Liverpool", "Dublin", "Toronto", "Vancouver", "Ottawa"]
  GENDERS = %w[Female Male]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :photo, PhotoUploader

  has_many :availabilities, dependent: :destroy

  has_many :attendees, dependent: :destroy
  has_many :meals, through: :attendees

  has_many :user_interests, dependent: :destroy
  has_many :interests, through: :user_interests

  validates :first_name, presence: true, blank: false
  validates :gender, presence: true, inclusion: { in: GENDERS }
  validates :location, presence: true, inclusion: { in: LOCATIONS }
  validates :age, numericality: { greater_than_or_equal_to: 18 }


  def past_meals
    query = "Select Distinct(meals.*) \
            from meals join attendees \
            on attendees.meal_id = meals.id \
            where reservation_date < \'#{Date.today}\' \
            and \
            status = 'Confirmed'"
    Meal.find_by_sql(query)
  end

  def upcoming_meals
    query = "Select Distinct(meals.*) \
            from meals join attendees \
            on attendees.meal_id = meals.id \
            where reservation_date >= \'#{Date.today}\' \
            and \
            status != 'Rejected' \
            and \
            user_id = #{id}"
    Meal.find_by_sql(query)
  end

  def upcoming_unconfirmed_meals
    query = "Select Distinct(meals.*) \
            from meals join attendees \
            on attendees.meal_id = meals.id \
            where reservation_date >= \'#{Date.today}\' \
            and \
            status = 'Invited' \
            and \
            user_id = #{id}"
    Meal.find_by_sql(query)
  end

  def upcoming_confirmed_meals
    query = "Select Distinct(meals.*) \
            from meals join attendees \
            on attendees.meal_id = meals.id \
            where reservation_date >= \'#{Date.today}\' \
            and \
            status = 'Confirmed' \
            and \
            user_id = #{id}"
    Meal.find_by_sql(query)
  end

  private
  def create_user_interests
    Interest.all.each do |interest|
      UserInterest.create!(user: self, interest: interest)
    end
  end
end
