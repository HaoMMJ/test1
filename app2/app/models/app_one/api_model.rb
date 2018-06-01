class AppOne::ApiModel < ActiveRecord::Base
  self.abstract_class = true
  establish_connection DB_ONE_CONFIG
end