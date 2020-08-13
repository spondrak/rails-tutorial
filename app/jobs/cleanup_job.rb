class CleanupJob < ApplicationJob
  queue_as :default

  def perform(duration)
    sleep duration
  end
end
