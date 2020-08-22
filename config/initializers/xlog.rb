Xlog.configure do |config|
  config.custom_logger = Logger.new(STDOUT) # or Logger.new('foo.log', 10, 1024000) or any other
end