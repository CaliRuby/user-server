if defined?(JazzFingers)
  JazzFingers.configure do |config|
    config.colored_prompt = true
    config.awesome_print = true
    config.application_name = UserServer
  end

  require 'jazz_fingers/setup'
end
