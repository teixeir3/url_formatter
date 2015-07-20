# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'url_formatter/version'

Gem::Specification.new do |spec|
  spec.name          = "url_formatter"
  spec.version       = UrlFormatter::VERSION
  spec.authors       = ["Douglas Teixeira"]
  spec.email         = ["teixeir3@gmail.com"]

  spec.homepage    = "http://github.com/teixeir3/url_formatter"
  spec.summary     = %q{Format and validate a URL in Active Record}
  spec.description   = %q{Format and validate a URL in Active Record as an example of how to make a gem.}
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "supermodel"
end
