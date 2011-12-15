# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "millibot/version"

Gem::Specification.new do |s|
  s.name        = "millibot"
  s.version     = Millibot::VERSION
  s.authors     = ["Millisami"]
  s.email       = ["millisami@gmail.com"]
  s.homepage    = "https://github.com/millisami/millibot"
  s.summary     = "The re-tweet bot with growl notification"
  s.description = "The re-tweet bot with growl notification with an GUI app builtin"

  s.rubyforge_project = "millibot"

  s.files         = Dir["**/*"].reject { |f| File.directory?(f) || f == "Gemfile.lock" }
  s.test_files    = []
  s.executables   = %w[millibot]
  s.require_paths = %w[lib]

  s.add_dependency 'growl',    '~>1.0.3'
  s.add_dependency 'foreverb', '~>0.2.6'
  s.add_dependency 'sequel'
  s.add_dependency 'sqlite3'
  
  s.add_development_dependency 'pry'
end
