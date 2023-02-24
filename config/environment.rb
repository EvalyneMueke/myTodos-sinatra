ENV["RAKE_ENV"] ||= "production"

require "bundler/setup"
Bundler.require(:default, ENV["RAKE_ENV"])

require_all "app"


