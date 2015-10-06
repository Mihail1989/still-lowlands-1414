require_relative 'running_rack/data'
require_relative 'running_rack/table'
module RunningRack
  @cache = {}

  def self.print type = :web
    data type
  end

  def self.cache
    @cache
  end

  def self.drop_cache!
    @cache = {}
  end

  private

  def self.data type
    data = Data.import
    @cache[type] ||= Table.new(data).print
  end
end

#puts RunningRack.print
#puts RunningRack.print
#puts RunningRack.show_cache