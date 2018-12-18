class Meal < ApplicationRecord
  belongs_to :restaurant
  belongs_to :interest
  has_many :attendees, dependent: :destroy
  has_many :users, through: :attendees
  validates :capacity, numericality: { greater_than_or_equal_to: 0, less_than: 9 }

  def invited_users
    User.joins(:attendees).where("attendees.meal_id = #{id} and attendees.status =  'Invited'")
  end

  def confirmed_users
    User.joins(:attendees).where("attendees.meal_id = #{id} and attendees.status =  'Confirmed'")
  end
end
