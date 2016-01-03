class Home
  require "connection/arduino"
  before_action :new_arudino
  def show_tmp
    if @arduino.read.blank?
      flash[:notice] = "Arduino connection error"
    else
      response.headers.delete('Content-Length')
      response.headers['Cache-Control'] = 'no-cache'
      response.headers['Content-Type'] = 'text/event-stream'
      self.response_body = Enumerator.new do |y|
        loop do
          @arduino.read
        end
      end
    end
  end
  def new_arudino
    @arduino = Arduino.new(Setting.configs)
  end
end
