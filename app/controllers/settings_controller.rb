require 'yaml'
require 'connection/arduino'
class SettingsController < ApplicationController
  before_action :prepare_settings
  def show
  end
  def change
  end
  def change_update
    prepare_params_and_save()
    redirect_to change_setting_path
  end
  def prepare_settings
    @settings = Setting.configs
  end
  def prepare_params_and_save
    prepare = ["port" , "baud"]
    save_data = Hash.new
    prepare.each do |param|
     params[param] ? save_data[param]  = params[param] : @settings[param]
    end
    File.open('config/setting_config.yml', 'w') do |file|
        file.write(YAML.dump(save_data))
    end
  end
end
