SimpleCov.start do
  add_filter '/spec/'
  add_group "Loggers", 'lib/footprint/log'
  add_group "Middleware", 'lib/footprint/middleware'
end