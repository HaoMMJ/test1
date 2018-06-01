class ConsumerJob < ApplicationJob
  queue_as :default
 
  def perform()
    seed = Seed.get_random_for_consumer
    if seed.present?
      seed.is_consumed = true
      seed.save
      fruit_label = "j-#{rand}"
      Fruit.create(seed_id: seed.id, name: fruit_label)
      app_one_seed = AppOne::Seed.where(label: seed.label, group: 2).first
      app_one_seed = AppOne::Seed.create(label: seed.label, group: 2) if app_one_seed.nil?
      app_one_seed.is_consumed = true
      app_one_seed.save
      AppOne::Fruit.create(seed_id: app_one_seed.id, name: fruit_label)
    end
  end
end