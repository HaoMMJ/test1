class ConsumerJob < ApplicationJob
  queue_as :default
 
  def perform()
    seed = AppOne::Seed.get_random_for_consumer
    if seed.present?
      seed.is_consumed = true
      seed.save
      fruit_label = "j-#{rand}"
      AppOne::Fruit.find_or_create_by(seed_id: seed.id, name: fruit_label)
    end
  end
end