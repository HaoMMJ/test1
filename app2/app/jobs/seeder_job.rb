class SeederJob < ApplicationJob
  queue_as :default
 
  def perform()
    Seed.create(label: "2-#{rand}")
  end
end