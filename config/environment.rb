ENV["RAKE_ENV"] ||= "development"

require "bundler/setup"
Bundler.require(:default, ENV["RAKE_ENV"])

require_all "app"


