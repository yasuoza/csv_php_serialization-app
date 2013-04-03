# Sprockets configuration
# http://arthurchiu.com/posts/20130328-sprockets_bower_padrino

SPROCKETS = Sprockets::Environment.new Padrino.root('app/assets')
SPROCKETS.append_path File.expand_path Padrino.root('app/assets/javascripts')
SPROCKETS.append_path File.expand_path Padrino.root('app/assets/stylesheets')
SPROCKETS.append_path File.expand_path Padrino.root('app/assets/vendor/images')
SPROCKETS.append_path File.expand_path Padrino.root('app/assets/vendor/javascripts')
SPROCKETS.append_path File.expand_path Padrino.root('app/assets/vendor/stylesheets')
SPROCKETS.append_path File.expand_path Padrino.root('app/assets/vendor/images')
SPROCKETS.append_path File.expand_path Padrino.root('app/assets/components')

if Padrino.env == :development
  SPROCKETS.css_compressor = YUI::CssCompressor.new
  SPROCKETS.js_compressor  = Uglifier.new(mangle: true)
end
