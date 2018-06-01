DB_ONE_CONFIG = YAML.load_file("#{Rails.root}/config/db.yml")[Rails.env+'_one']

# As our secondary db is being defined in production_sec.
DB_TWO_CONFIG = YAML.load_file("#{Rails.root}/config/db.yml")[Rails.env+'_two']