class Home
  require "connection/arduino"
  def tmp(*args)
    Arduino.new(args[0])
  end
end
