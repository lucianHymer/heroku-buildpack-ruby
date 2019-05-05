require "language_pack/cache"
require_relative "./base_cache"

class LanguagePack::WebpackerCache
  CACHE_NAME = 'webpacker'
  CACHE_PATH = 'tmp/cache/webpacker'

  include BaseCache
end
