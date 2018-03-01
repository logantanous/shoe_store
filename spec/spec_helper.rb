# ENV['RACK_ENV'] = 'test'
#
# require("bundler/setup")
# Bundler.require(:default, :test)
# set(:root, Dir.pwd())
#
#
# require "shoulda/matchers"
# # require File.dirname(__FILE__) + '/../lib/*.rb'
# Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each { |file| require file }
#
# require('capybara/rspec')
# Capybara.app = Sinatra::Application
# set(:show_exceptions, false)
# require('./app')
ENV['RACK_ENV'] = 'test'

require("bundler/setup")
Bundler.require(:default, :test)
set(:root, Dir.pwd())


require "shoulda/matchers"
require "shoulda/matchers/integrations/rspec"
# require File.dirname(__FILE__) + '/../lib/*.rb'
Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each { |file| require file }

require('capybara/rspec')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)
require('./app')
