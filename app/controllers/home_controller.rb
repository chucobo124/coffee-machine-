class HomeController < ApplicationController
  require "connection/arduino"
  def index
  end
  def get_tmp
    @tmp= Arduino.new("")
  end
end
