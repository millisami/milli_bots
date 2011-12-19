#!/usr/bin/env ruby
require 'logger'

$LOAD_PATH.unshift ::File.expand_path(::File.dirname(__FILE__) + '/lib')
require 'millibot/server'

use Rack::ShowExceptions
run Millibot::Server.new
