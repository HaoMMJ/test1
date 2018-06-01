class SeederJob < ApplicationJob
  queue_as :default
 
  def perform()
    new_label = "2-#{rand}"
    Seed.create(label: new_label)
    AppOne::Seed.create(label: new_label, group: 2)
  end
end