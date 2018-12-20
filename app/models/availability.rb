class Availability < ApplicationRecord
  after_create :callScheduler
  belongs_to :user

  validates :date, presence: true, blank: false
  validates_uniqueness_of :date, scope: :user

  private
  def callScheduler
    # MealSchedulerJob.perform_now
  end
end
