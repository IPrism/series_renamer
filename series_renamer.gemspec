# -*- encoding: utf-8 -*-
require File.expand_path('../lib/series_renamer/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Romain Fricon"]
  gem.email         = ["romain.fricon@gmail.com"]
  gem.description   = %q{Rename series videos and subtitles files with a convention}
  gem.summary       = %q{Rename series videos and subtitles files with a convention}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "series_renamer"
  gem.require_paths = ["lib"]
  gem.version       = SeriesRenamer::VERSION
end
