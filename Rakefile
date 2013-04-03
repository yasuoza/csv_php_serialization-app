PADRINO_ENV  = ENV['PADRINO_ENV'] ||= ENV['RACK_ENV'] ||= 'development'  unless defined?(PADRINO_ENV)
PADRINO_ROOT = File.expand_path('../', __FILE__) unless defined?(PADRINO_ROOT)
require 'bundler/setup'
require 'padrino-core/cli/rake'
require 'sprockets/../rake/sprocketstask'

Bundler.require(PADRINO_ENV)
require File.join(PADRINO_ROOT, 'config/sprockets')
PadrinoTasks.use(:database)
PadrinoTasks.use(:activerecord)
PadrinoTasks.init

Rake::SprocketsTask.new do |t|
  t.environment = SPROCKETS.tap do |env|
    env.css_compressor = YUI::CssCompressor.new
    env.js_compressor  = Uglifier.new(mangle: true)
  end
  manifest_path = File.expand_path('../public/assets/manifest.json', __FILE__)
  t.output      = File.join(PADRINO_ROOT, 'public/assets')
  t.manifest    = Sprockets::Manifest.new(SPROCKETS, manifest_path)
  t.assets      = %w(application.js application.css)
end
