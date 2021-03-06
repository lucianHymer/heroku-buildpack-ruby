require "language_pack/cache"
require_relative "./base_cache"

# manipulating the `vendor/bundle` Bundler cache directory.
# supports storing the cache in a "stack" directory
class LanguagePack::BundlerCache
  CACHE_NAME = 'bundler'
  CACHE_PATH = 'vendor/bundle'

  include BaseCache
end
