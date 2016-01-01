class HomeController < ApplicationController
  require "connection/arduino"
  def index
  end
  def tmp
    @tmp= Arduino.new(Setting.configs)
    @tmp_result = {:tmp =>@tmp.read.match(/(?!tmp=)[0-9]+/).to_s}
    respond_to do |format|
     format.json { render :json => @tmp_result.to_json }
    end
  end
end
