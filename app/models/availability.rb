class Availability < ApplicationRecord
  after_create :callScheduler
  belongs_to :user

  validates :date, presence: true, blank: false
  validates_uniqueness_of :date, scope: :user

  private
  def callScheduler
    # MealSchedulerService.new.create_events
  end
end
