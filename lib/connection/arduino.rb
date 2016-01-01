require "serialport"
class Arduino
  def initialize(*args)
    begin
      prepare(args)
    rescue
      return "Arduino Can not connect completly"
    end
  end
  def read
    return @arduino.gets
  end
  def close
    @arduino.close
  end
  def prepare(args)
    args = args[0]
    serialport = args["port"].to_s
    baudray = args["baud"].to_i
    @arduino = SerialPort.new(serialport , baudray)
  end
end
