class Availability < ApplicationRecord
  belongs_to :user

  validates :date, presence: true, blank: false
  validates_uniqueness_of :date, scope: :user

end
