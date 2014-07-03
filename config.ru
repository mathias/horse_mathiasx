#!/usr/bin/env ruby
require 'bundler'
Bundler.setup

unless ENV.has_key? 'RACK_ENV'
  ENV['RACK_ENV'] = 'development'
end

if ENV['RACK_ENV'] == 'development'
  require 'dotenv'
  Dotenv.load
end

# Add /lib/ to our load path
$LOAD_PATH.unshift("#{File.dirname(__FILE__)}/lib")

require 'horse_mathiasx/apps/base'

run HorseMathiasx::Apps::Base.new
