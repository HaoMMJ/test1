class AppOne::ApiModel < ActiveRecord::Base
  self.abstract_class = true
  establish_connection "#{ENV['APP_1_DATABASE_URL']}"
end