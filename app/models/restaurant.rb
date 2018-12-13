class Restaurant < ApplicationRecord
  has_many :meals
  has_many :attendees, through: meals

  validates :name, presence: true, blank: false
  validates :address, presence: true, blank: false
  validates :location, presence: true, inclusion: { in: User::LOCATION }
end
