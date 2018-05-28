class SeederJob < ApplicationJob
  queue_as :default
 
  def perform()
    Seed.create(label: "1-#{rand}")
  end
end