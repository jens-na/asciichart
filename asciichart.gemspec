# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "asciichart/version"

Gem::Specification.new do |s|
  s.name        = "asciichart"
  s.version     = Asciichart::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Jens Nazarenus"]
  s.email       = ["jens@0x6a.de"]
  s.homepage    = "https://github.com/jens-na/asciichart"
  s.summary     = %q{render ascii charts}
  s.description = %q{render ascii art charts to images}

  s.add_runtime_dependency("launchy")
  s.add_development_dependency("rspec", "~>2.5.0")
  s.add_development_dependency('rake', "~> 10.1")
  s.add_development_dependency('cucumber', "~> 1.3")
  s.add_development_dependency('redgreen', "~> 1.2")
  s.add_development_dependency('shoulda-context', "~> 1.1.6") 
  s.add_development_dependency('rr', "~> 1.1")
  
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end

