require "pathname"
require "fileutils"
require "language_pack/cache"

# manipulating the `vendor/bundle` Bundler cache directory.
# supports storing the cache in a "stack" directory
class LanguagePack::BundlerCache << LanguagePack::BaseCache
  CACHE_NAME = 'bundler'
  CACHE_PATH = 'vendor/bundle'
end
