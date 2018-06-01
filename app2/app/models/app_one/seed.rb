class AppOne::Seed < AppOne::ApiModel
  has_one :fruit
  scope :get_random_for_consumer, ->{
    where(is_consumed: false).order("RANDOM()").first
  }
end
