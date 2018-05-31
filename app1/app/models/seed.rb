class Seed < ApplicationRecord
  scope :get_random_for_consumer, ->{
    where(is_consumed: false).
    where(group: 1).
    order("RANDOM()").first
  }
end
