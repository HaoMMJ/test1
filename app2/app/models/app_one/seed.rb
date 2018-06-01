class AppOne::Seed < AppOne::ApiModel
  has_one :fruit
  scope :get_random_for_consumer, ->{
    where(is_consumed: false).
    where(group: 2).
    order("RANDOM()").first
  }
end
