require "pathname"
require "fileutils"
require "language_pack/cache"

# manipulating the `vendor/bundle` Bundler cache directory.
# supports storing the cache in a "stack" directory
class LanguagePack::BaseCache
  CACHE_NAME = nil # DEFINE
  CACHE_PATH = nil # DEFINE
  DIR_SYM =  "#{self.class::CACHE_NAME}_dir".to_sym 

  attr_reader DIR_SYM

  # @param [LanguagePack::Cache] cache object
  # @param [String] stack buildpack is running on
  def initialize(cache, stack = nil)
    @cache       = cache
    @stack       = stack
    @cache_dir   = Pathname.new(CACHE_PATH)
    @stack_dir   = @stack ? Pathname.new(@stack) + @cache_dir : @cache_dir
  end

  define_method(DIR_SYM) do
    @cache_dir
  end

  # removes the bundler cache dir BOTH in the cache and local directory
  def clear(stack = nil)
    stack ||= @stack
    @cache.clear(stack)
    @cache_dir.rmtree
  end

  # converts to cache directory to support stacks. only copy contents if the stack hasn't changed
  # @param [Boolean] denote if there's a stack change or not
  def convert_stack(stack_change)
    @cache.cache_copy(@cache_dir, @stack_dir) unless stack_change
    @cache.clear(@cache_dir)
  end

  # detects if using the non stack directory layout
  def old?
    @cache.exists?(@cache_dir)
  end

  def exists?
    @cache.exists?(@stack_dir)
  end

  # writes cache contents to cache store
  def store
    @cache.store(@cache_dir, @stack_dir)
  end

  # loads cache contents from the cache store
  def load
    @cache.load(@stack_dir, @cache_dir)
  end
end
