require "serialport"
class Arduino
  def initialize(*args)
    prepare(args)
  end
  def read
    return @arduino.gets
  end
  def prepare(args)
    args = args[0]
    serialport = args[:port]
    baudray = args[:baud]
    @arduino = SerialPort.new(serialport , baudray)
  end
end
