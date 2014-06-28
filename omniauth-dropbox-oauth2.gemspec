# encoding: utf-8
$:.push File.expand_path('../lib', __FILE__)
require 'omniauth-dropbox-oauth2/version'

Gem::Specification.new do |gem|
  gem.name        = 'omniauth-dropbox-oauth2'
  gem.version     = OmniAuth::DropboxOauth2::VERSION
  gem.homepage    = 'https://github.com/bamorim/omniauth-dropbox-oauth2'

  gem.author      = "Bernardo Amorim"
  gem.email       = 'contato@bamorim.com'
  gem.description = 'Dropbox OAuth2 strategy for OmniAuth 1.x'
  gem.summary     = gem.description

  gem.add_dependency "omniauth-oauth2"

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec', '~> 2.7'

  gem.executables = `git ls-files -- bin/*`.split("\n").map{|f| File.basename(f)}
  gem.files       = `git ls-files`.split("\n")
  gem.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")

  gem.require_paths = ['lib']
end