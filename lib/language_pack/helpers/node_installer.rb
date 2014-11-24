class LanguagePack::NodeInstaller
  MODERN_NODE_VERSION = "0.10.30"
  MODERN_BINARY_PATH  = "node-v#{MODERN_NODE_VERSION}-linux-x64"

  NODEJS_BASE_URL     = "http://nodejs.org/dist/v#{MODERN_NODE_VERSION}/"

  def initialize(stack)
    @fetchers = {
      modern: LanguagePack::Fetcher.new(NODEJS_BASE_URL),
    }
  end

  def version
    MODERN_NODE_VERSION
  end

  def binary_path
    MODERN_BINARY_PATH
  end

  def install
    node_bin = "#{MODERN_BINARY_PATH}/bin/node"
    @fetchers[:modern].fetch_untar("#{MODERN_BINARY_PATH}.tar.gz", "#{MODERN_BINARY_PATH}/bin/node")
    FileUtils.mv(node_bin, ".")
    puts "Installed node to '#{Dir.pwd}'"
    FileUtils.rm_rf(MODERN_BINARY_PATH)
  end
end
