class HomeController < ApplicationController
  require "connection/arduino"
  def index
    @tmp = Arduino.new(:port => "/dev" )
  end
end
