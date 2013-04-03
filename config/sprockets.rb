# Sprockets configuration
# http://arthurchiu.com/posts/20130328-sprockets_bower_padrino

SPROCKETS = Sprockets::Environment.new File.join(PADRINO_ROOT)
SPROCKETS.append_path File.expand_path File.join(PADRINO_ROOT, 'app/assets/javascripts')
SPROCKETS.append_path File.expand_path File.join(PADRINO_ROOT, 'app/assets/stylesheets')
SPROCKETS.append_path File.expand_path File.join(PADRINO_ROOT, 'app/assets/vendor/images')
SPROCKETS.append_path File.expand_path File.join(PADRINO_ROOT, 'app/assets/vendor/javascripts')
SPROCKETS.append_path File.expand_path File.join(PADRINO_ROOT, 'app/assets/vendor/stylesheets')
SPROCKETS.append_path File.expand_path File.join(PADRINO_ROOT, 'app/assets/vendor/images')
SPROCKETS.append_path File.expand_path File.join(PADRINO_ROOT, 'app/assets/components')

if PADRINO_ENV == 'development'
  # SPROCKETS.css_compressor = YUI::CssCompressor.new
  # SPROCKETS.js_compressor  = Uglifier.new(mangle: true)
end
