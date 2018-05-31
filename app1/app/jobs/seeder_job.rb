class SeederJob < ApplicationJob
  queue_as :default
 
  def perform()
    Seed.create(label: "1-#{rand}", group: 1)
  end
end