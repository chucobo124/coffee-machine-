class HomeController < ApplicationController
  require "connection/arduino"
  before_action :prepare_arduino
  def index
  end
  def show_tmp
    response.headers.delete('Content-Length')
    response.headers['Cache-Control'] = 'no-cache'
    response.headers['Content-Type'] = 'text/event-stream'
    self.response_body = Enumerator.new do |y|
      loop do
        tmp_result = @tmp.read.match(/(?!tmp=)[0-9]+/).to_s
        y << "event: counter\n"
        y << "data: #{tmp_result} \n\n"
        sleep 0.5
      end
    end
  end
  def prepare_arduino
    @tmp= Arduino.new(Setting.configs)
  end
end
