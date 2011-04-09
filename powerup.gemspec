# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "powerup/version"

Gem::Specification.new do |s|
  s.name        = "powerup"
  s.version     = Powerup::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Jan-Oliver Jahner"]
  s.email       = ["jojahner@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{use pow with your application}
  s.description = %q{adds rake tasks to use your application with pow}

  s.rubyforge_project = "powerup"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
