class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  establish_connection DB_TWO_CONFIG
end
