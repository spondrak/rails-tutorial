class ApplicationJob < ActiveJob::Base
  # Automatically retry jobs that encountered a deadlock
  # retry_on ActiveRecord::Deadlocked

  # Most jobs are safe to ignore if the underlying records are no longer available
  # discard_on ActiveJob::DeserializationError

  around_perform do |job, block|
    Honeycomb.start_span(name: 'active_job') do |span|
      span.add_field 'active_job.class', job.class.name
      span.add_field 'active_job.arguments', job.arguments
      block.call
    end
  end
end
