require "language_pack/cache"
require_relative "./base_cache"

class LanguagePack::WebpacksCache
  CACHE_NAME = 'webpacks'
  CACHE_PATH = 'public/packs'

  include BaseCache
end
