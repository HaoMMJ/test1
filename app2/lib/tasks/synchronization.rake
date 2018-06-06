namespace :synchronization do
  task :merge_consumed_seeds => :environment do
    first_migrated_item = AppOne::Seed.where(group: 2).order(created_at: :asc).first
    seeds = Seed.joins("left join fruits on fruits.seed_id = seeds.id").
              where("seeds.created_at < ?", first_migrated_item.created_at).
              where("seeds.is_consumed = true").
              select("seeds.label, seeds.is_consumed, fruits.name")
    seeds.each{|seed|
      app_one_seed = AppOne::Seed.where(label: seed.label, group: 2).first
      app_one_seed = AppOne::Seed.create(label: seed.label, group: 2) if app_one_seed.nil?
      app_one_seed.is_consumed = true
      app_one_seed.save
      AppOne::Fruit.find_or_create_by(seed_id: app_one_seed.id, name: seed.name)
    }
  end

  task :merge_not_consumed_seeds => :environment do
    first_migrated_item = AppOne::Seed.where(group: 2).order(created_at: :asc).first
    seeds = Seed.where("created_at < ?", first_migrated_item.created_at).
              where(is_consumed: false)
    seeds.each{|seed|
      AppOne::Seed.find_or_create_by(label: seed.label, group: 2)
    }
  end

  task :merge_all_seeds => :environment do
    first_migrated_item = AppOne::Seed.where(group: 2).order(created_at: :asc).first
    seeds = Seed.joins("left join fruits on fruits.seed_id = seeds.id").
              where("seeds.created_at < ?", first_migrated_item.created_at).
              select("seeds.label, seeds.is_consumed, fruits.name")
    seeds.each{|seed|
      AppOne::Seed.create(label: seed.label, group: 2)
    }

    consumed_seeds = Seed.joins("left join fruits on fruits.seed_id = seeds.id").
              where("seeds.created_at < ?", first_migrated_item.created_at).
              where("seeds.is_consumed = true").
              select("seeds.label, seeds.is_consumed, fruits.name")
    consumed_seeds.each{|seed|
      app_one_seed = AppOne::Seed.where(label: seed.label, group: 2).first
      app_one_seed.is_consumed = true
      app_one_seed.save
      AppOne::Fruit.create(seed_id: app_one_seed.id, name: seed.name)
    }
  end
end
