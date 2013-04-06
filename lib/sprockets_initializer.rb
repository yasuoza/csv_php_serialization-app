module SprocketsInitializer
  def call(env)
    asset_prefix = Sprockets::Helpers.prefix
    if env['PATH_INFO'].match(asset_prefix)
      env['PATH_INFO'].gsub!(asset_prefix, '')
      return SPROCKETS.call(env)
    end

    super
  end
end
