# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cb_list/version'

Gem::Specification.new do |spec|
  spec.name          = "cb_list"
  spec.version       = CbList::VERSION
  spec.authors       = ["Zoran Žabčić"]
  spec.email         = ["zoran@effectiva.hr"]

  spec.summary       = %q{List Active Record callbacks.}
  spec.description   = %q{List Active Record callbacks for a given class.}
  spec.homepage      = "https://github.com/zoki/cb_list"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    # spec.metadata['allowed_push_host'] = "http://mygemserver.com"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "colorize"

  spec.add_development_dependency "activerecord", "~> 5.1"
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
