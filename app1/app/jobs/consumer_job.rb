class ConsumerJob < ApplicationJob
  queue_as :default
 
  def perform()
    seed = Seed.get_random_for_consumer
    if seed.present?
      seed.is_consumed = true
      seed.save
    end
  end
end