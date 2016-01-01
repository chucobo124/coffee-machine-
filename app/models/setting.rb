class Setting < ActiveRecord::Base
 class << self
   def configs
     return YAML.load_file('config/setting_config.yml')
   end
 end
end
