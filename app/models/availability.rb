class Availability < ApplicationRecord
  belongs_to :user

  validates :date, presence: true, blank: false
end
