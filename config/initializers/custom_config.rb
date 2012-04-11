c = YAML.load_file("#{Rails.root}/config/config.yml")
CFG = c['default'].merge(c[Rails.env])