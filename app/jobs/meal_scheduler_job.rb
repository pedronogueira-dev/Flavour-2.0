class MealSchedulerJob < ApplicationJob
  queue_as :schedulers

  def perform(*args)
    # Do something later
    puts "Scheduling Meals"
    MealSchedulerService.new.create_events
  end
end
