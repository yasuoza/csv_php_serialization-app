##
# This file mounts each app in the Padrino project to a specified sub-uri.
# You can mount additional applications using any of these commands below:
#
#   Padrino.mount('blog').to('/blog')
#   Padrino.mount('blog', :app_class => 'BlogApp').to('/blog')
#   Padrino.mount('blog', :app_file =>  'path/to/blog/app.rb').to('/blog')

# You can also map apps to a specified host:
#
#   Padrino.mount('Admin').host('admin.example.org')
#   Padrino.mount('WebSite').host(/.*\.?example.org/)
#   Padrino.mount('Foo').to('/foo').host('bar.example.org')
#
# Note 1: Mounted apps (by default) should be placed into the project root at '/app_name'.
# Note 2: If you use the host matching remember to respect the order of the rules.
#
# By default, this file mounts the primary app which was generated with this project.
# However, the mounted app can be modified as needed:
#
#   Padrino.mount('AppName', :app_file => 'path/to/file', :app_class => 'BlogApp').to('/')
#

##
# Setup global project settings for your apps. These settings are inherited by every subapp. You can
# override these settings in the subapps as needed.
#
Padrino.configure_apps do
  enable :sessions
  set :session_secret, '86a5489afdb990f9cdf983441441fdbc449bc7fb1c9e383b724e01f8aef81b64'
  set :protection, true
  set :protect_from_csrf, true

  # Sprockets configuration
  # http://arthurchiu.com/posts/20130328-sprockets_bower_padrino
  set :sprockets, SPROCKETS
  Sprockets::Helpers.configure do |config|
    manifest_path      = Padrino.root('public/assets/manifest.json')
    config.environment = sprockets
    config.prefix      = '/assets'
    config.manifest    = Sprockets::Manifest.new(sprockets, manifest_path)
    config.digest      = true
    config.public_path = public_folder

    if Padrino.env == :development
      config.expand    = true
    end
  end
end

# Mounts the core application for this project
Padrino.mount('PhpSerializer::App', :app_file => Padrino.root('app/app.rb')).to('/')
