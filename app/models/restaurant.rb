class Restaurant < ApplicationRecord
  has_many :meals, dependent: :destroy
  has_many :attendees, through: :meals

  validates :name, presence: true, blank: false
  validates :address, presence: true, blank: false
  validates :location, presence: true, inclusion: { in: User::LOCATIONS }

  #geocoded_by :address
  #after_validation :geocode, if: :will_save_change_to_address?
end
