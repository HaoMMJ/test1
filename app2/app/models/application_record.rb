class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  establish_connection "#{ENV['DATABASE_URL']}"
end
