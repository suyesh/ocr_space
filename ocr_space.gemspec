# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ocr_space/version'
require 'ocr_space/banner'

Gem::Specification.new do |spec|
    spec.name = 'ocr_space'
    spec.version       = OcrSpace::VERSION
    spec.authors       = ['Suyesh Bhandari']
    spec.email         = ['suyeshb@gmail.com']

    spec.summary       = 'Free Online OCR for Ruby - Convert images to text '
    spec.description   = 'Free Online OCR for Ruby - Convert images to text '
    spec.homepage      = 'https://github.com/suyesh/ocr_space'
    spec.license       = 'MIT'

    # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
    # to allow pushing to a single host or delete this section to allow pushing to any host.
    if spec.respond_to?(:metadata)
        spec.metadata['allowed_push_host'] = 'https://rubygems.org'
    else
        raise 'RubyGems 2.0 or newer is required to protect against ' \
          'public gem pushes.'
    end

    spec.files = `git ls-files -z`.split("\x0").reject do |f|
        f.match(%r{^(test|spec|features)/})
    end
    spec.bindir        = 'exe'
    spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
    spec.require_paths = ['lib']
    spec.post_install_message = OcrSpace::Banner.new.to_s

    spec.add_development_dependency 'bundler', '~> 1.13'
    spec.add_development_dependency 'rake', '~> 10.0'
    spec.add_development_dependency 'pry'
    spec.add_dependency 'json'
    spec.add_dependency 'httparty'
    spec.add_dependency 'httmultiparty'
    spec.add_dependency 'colorize'
end
